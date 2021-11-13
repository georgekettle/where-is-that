import { Controller } from '@hotwired/stimulus';
// mapbox
import mapboxgl from '!mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
// mapbox geocoder
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

export default class extends Controller {
  static targets = ['container', 'search'];
  static values = {
    mapboxKey: String,
    search: String,
    locations: {
      type: Array,
      default: []
    },
    markers: {
      type: Array,
      default: []
    }
  }

  connect() {
    const _this = this
    mapboxgl.accessToken = this.mapboxKeyValue;
    this.initMap()
    this.map.on('load', () => {
      _this.initClusters()
      _this.initSearch()
      _this.map.on('moveend', () => {
        _this.updateLocations()
      });
      _this.geocoder.on('result', _this.onResult.bind(_this));
      _this.initControls()
    })
  }

  initMap() {
    this.map = new mapboxgl.Map({
      container: this.containerTarget,
      style: 'mapbox://styles/georgekettle/ckpootagp05f517mp0m887sq1'
    });
    this.map.setPadding({ right: 30, left: 30, top: 30, bottom: 30});
  }

  initClusters() {
    this.map.addSource('locations', {
      type: 'geojson',
      // Point to GeoJSON data. This example visualizes all M1.0+ locations
      // from 12/22/15 to 1/21/16 as logged by USGS' Earthquake hazards program.
      data: {
        "type": "FeatureCollection",
        "features": this.locationsValue
      },
      cluster: true,
      clusterMaxZoom: 14, // Max zoom to cluster points on
      clusterRadius: 50 // Radius of each cluster when clustering points (defaults to 50)
    });

    this.map.addLayer({
      id: 'clusters',
      type: 'circle',
      source: 'locations',
      filter: ['has', 'point_count'],
      paint: {
        // Use step expressions (https://docs.mapbox.com/mapbox-gl-js/style-spec/#expressions-step)
        // with three steps to implement three types of circles:
        //   * Blue, 20px circles when point count is less than 100
        //   * Yellow, 30px circles when point count is between 100 and 750
        //   * Pink, 40px circles when point count is greater than or equal to 750
        'circle-color': ['step',['get', 'point_count'],'#FF6941',100,'#FF6941'],
        'circle-radius': ['step',['get', 'point_count'],15,15,20]
      }
    });

    this.map.addLayer({
      id: 'cluster-count',
      type: 'symbol',
      source: 'locations',
      filter: ['has', 'point_count'],
      layout: {
        'text-field': '{point_count_abbreviated}',
        'text-font': ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
        'text-size': 12,
      },
      paint: {
        "text-color": "#ffffff"
      }
    });

    this.map.addLayer({
      id: 'unclustered-point',
      type: 'circle',
      source: 'locations',
      filter: ['!', ['has', 'point_count']],
      paint: {
        'circle-color': '#FF6941',
        'circle-radius': 5,
        'circle-stroke-width': 1,
        'circle-stroke-color': '#fff'
      }
    });
  }

  initSearch() {
    this.geocoder = new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl,
      placeholder: 'Search a place',
      flyTo: false
    });
    this.searchTarget.appendChild(this.geocoder.onAdd(this.map));
  }

  initControls() {
    // geolocate user
    this.geolocate = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      // When active the map will receive updates to the device's location as it changes.
      trackUserLocation: true,
      // Draw an arrow next to the location dot to indicate which direction the device is heading.
      showUserHeading: false
    })
    this.map.addControl(this.geolocate, 'bottom-right');

    // nav controls
    this.nav = new mapboxgl.NavigationControl({
      showCompass: false
    });
    this.map.addControl(this.nav, 'bottom-right');
  }

  locationsValueChanged(value, previousValue) {
    // this.markersValue.forEach(marker => marker.remove())
    // value.forEach((loc) => {
    //   // // create a HTML element for each loc
    //   // const el = document.createElement('div');
    //   // el.className = 'marker';


    //   // make a marker for each loc and add to the map
    //   const marker = new mapboxgl.Marker().setLngLat(loc.geometry.coordinates).addTo(this.map);
    //   this.markersValue.push(marker)
    // })

    if (this.map) {
      const data = {
        "type": "FeatureCollection",
        "features": value
      }
      this.map.getSource('locations').setData(data);
    }
  }

  onResult(e) {
    // // set the bounds (or fly to)
    if (e.result.bbox) {
      this.map.fitBounds(e.result.bbox, {duration: 300})
    } else {
      this.map.flyTo({
        center: e.result.center,
        duration: 300,
        zoom: 10
      });
    }
  }

  updateLocations() {
    const _this = this
    const CSRFToken = document.querySelector('meta[name="csrf-token"]').content
    const bbox = this.map.getBounds().toArray()
    const body = {
      bbox: bbox
    }
    fetch(this.searchValue, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': CSRFToken
      },
      body: JSON.stringify(body),
    })
      .then(response => response.json())
      .then(locations => _this.locationsValue = locations) // triggers this.locationsValueChanged
      .catch(err => console.log(err));
  }
}