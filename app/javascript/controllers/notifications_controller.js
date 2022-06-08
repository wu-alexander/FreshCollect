import consumer from "../channels/consumer"
import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log("Connected");
    consumer.subscriptions.create("Noticed::NotificationChannel", {
      received: (data) => {
        console.log(data);
        document.body.insertAdjacentHTML("beforeEnd", data.popup_html)
      }
    })
  }
}
