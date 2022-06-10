import * as confetti from 'canvas-confetti'
import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    var myConfetti = confetti.create(this.element, {
      resize: true,
      useWorker: true
    });
    myConfetti({
      particleCount: 200,
      spread: 160,
      colors: ["#D76834", "#E08E44", "#74896D"]
      // any other options from the global
      // confetti function
    });
  }

  hide() {
    this.element.remove()
  }
}
