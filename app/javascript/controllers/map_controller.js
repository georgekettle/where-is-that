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
  }

  connect() {
    const container = this.containerTarget
    mapboxgl.accessToken = this.mapboxKeyValue;
    this.map = new mapboxgl.Map({
      container: container,
      style: 'mapbox://styles/georgekettle/ckpootagp05f517mp0m887sq1'
    });

    // Add the control to the map.
    this.geocoder = new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
    });
    this.searchTarget.appendChild(this.geocoder.onAdd(this.map));

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

    this.searchTarget && this.searchTarget.querySelector('input').focus()
  }
}