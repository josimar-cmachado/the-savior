import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="wedding-event"
export default class extends Controller {
  static targets = ["hideTitleElement", "hideAddressElement"]

  connect() {
  }

  change() {
    this.hideTitleElementTarget.classList.toggle('d-none');
    this.hideAddressElementTarget.classList.toggle('d-none');
  }
}
