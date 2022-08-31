import { Controller } from "@hotwired/stimulus"
import Swiper from "swiper"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["menu"]

  connect() {
    super.connect()
    console.log('Do what you want here.')

    // The swiper instance.
    var swiper = new Swiper(".mySwiper", {
      on: {
        slideChange: (swiper) => {
          if (swiper.touches.diff < 0) {
            console.log("bookmark")
          }else {
            console.log("next");
          }
        }
      }
    });

    // Default options for every carousels.
    this.defaultOptions
  }
}
