import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['sidebar', 'hide', 'show'];
  static values = {
    activeClasses: {
      type: String,
      default: ''
    },
    active: {
      type: Boolean,
      default: false
    }
  }

  connect() {
    this.activeValue ? this.show() : this.hide()
  }

  toggle(e) {
    e.preventDefault()
    this.activeValue ? this.removeActiveClasses() : this.addActiveClasses()
    this.activeValue = !this.activeValue
    window.dispatchEvent(new Event('resize'));
  }

  show(e) {
    e && e.preventDefault()
    this.addActiveClasses()
    this.activeValue = true
    this.hideTarget.classList.remove('hidden')
    this.showTarget.classList.add('hidden')
    window.dispatchEvent(new Event('resize'));
  }

  hide(e) {
    e && e.preventDefault()
    this.removeActiveClasses()
    this.activeValue = false
    this.hideTarget.classList.add('hidden')
    this.showTarget.classList.remove('hidden')
    window.dispatchEvent(new Event('resize'));
  }

  removeActiveClasses() {
    this.sidebarTarget.classList.remove(...(this.activeClassesValue.split(' ')))
  }

  addActiveClasses() {
    this.sidebarTarget.classList.add(...(this.activeClassesValue.split(' ')))
  }
}