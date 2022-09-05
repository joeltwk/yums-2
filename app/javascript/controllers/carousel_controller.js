import { Controller } from "@hotwired/stimulus"
import Swiper from "swiper"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["bookmark"]

  connect() {
    super.connect()
    console.log('Do what you want here.');

    // The swiper instance.
    var swiper = new Swiper(".mySwiper", {
      on: {
        slideChange: (swiper) => {
          if (swiper.touches.diff > 0) {
            for (let i=0; i<this.bookmarkTargets.length; i++) {
              if (swiper.activeIndex == i){
                console.log(this.bookmarkTargets[i].value);
                const bookmark = `<meta http-equiv="refresh" content="0; url=/restaurants/${this.bookmarkTargets[i].value}/favourites/new">`;
                this.bookmarkTarget.insertAdjacentHTML("beforeend", bookmark);
              }
            }
          }
        }
      }
    });

    // Default options for every carousels.
    this.defaultOptions
  }
}
