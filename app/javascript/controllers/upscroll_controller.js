import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    setTimeout(() => {
      window.scrollTo(0, window.innerWidth / 2)
    }, 100);
  }
}
