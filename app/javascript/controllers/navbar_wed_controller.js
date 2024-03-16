import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar-wed"
export default class extends Controller {
  static values = {
    class: String
  }
  connect() {
    this.listener = () => {
      if (window.scrollY < this.scrollY) {
        // show the search bar
        this.element.classList.remove(this.classValue)
      } else if (window.scrollY > this.scrollY) {
        // hide the search bar
        this.element.classList.add(this.classValue)
      }
      this.scrollY = window.scrollY
    }
    window.addEventListener("scroll", this.listener)
  }

  disconnect() {
    window.removeEventListener("scroll", this.listener)
  }
}
