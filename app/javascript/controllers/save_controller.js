import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['button'];
  static values = {
  	id: Number,
  	url: String
  }

  connect() {
  }

  save(e) {
  	e.preventDefault()
  	this.sendRequest()
  }

  sendRequest() {
    const CSRFToken = document.querySelector('meta[name="csrf-token"]').content
    fetch(this.urlValue, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': CSRFToken
      }
    })
      .then(response => response.json())
      .then(this.onSuccess.bind(this))
      .catch(err => console.log(err));
  }

  onSuccess(data) {
  	// success handled by turbostreams at 'views/saves/create.turbo_stream.erb'
  }
}