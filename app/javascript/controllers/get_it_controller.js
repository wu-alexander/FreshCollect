import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["dateTimeInput"]

  connect() {
    console.log("Get it")
  }

  selectDateTime(event) {
    event.preventDefault()
    this.#focusDateTimeInput()
  }

  submit(event) {
    event.currentTarget.closest("form").submit()
  }

  #focusDateTimeInput() {
    this.dateTimeInputTarget.click()
  }
}
