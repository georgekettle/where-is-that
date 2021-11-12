import { Controller } from '@hotwired/stimulus';
import mapboxgl from '!mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

export default class extends Controller {
  static targets = ['container'];
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
  }
}