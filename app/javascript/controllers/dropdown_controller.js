import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  toggle() {
    this.menuTarget.classList.toggle("d-none")
  }
}
