import consumer from "../channels/consumer"
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["countDisplay", "list"]

  connect() {
    console.log("Connected");
    consumer.subscriptions.create("Noticed::NotificationChannel", {
      received: (data) => {
        document.body.insertAdjacentHTML("beforeEnd", data.popup_html)

        const noItemsDisplay = this.listTarget.querySelector(".js-no-items")
        if (noItemsDisplay) noItemsDisplay.remove()

        this.listTarget.insertAdjacentHTML("afterBegin", data.static_html)
        this.countDisplayTarget.classList.remove("d-none")
        this.countDisplayTarget.innerText = data.notification_count
      }
    })
  }
}
