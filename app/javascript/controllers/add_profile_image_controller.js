import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-profile-image"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("Add Profile Image Controller")
  }

  show() {
    this.formTarget.classList.toggle("d-none")
  }
}
