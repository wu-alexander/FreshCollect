import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    window.scrollTo(0, 0)
    setTimeout(() => {
      window.scrollTo(0, window.innerWidth / 2)
    }, 200);
  }
}
