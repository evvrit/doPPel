import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookings"
export default class extends Controller {
  static targets = ["acceptButton", "rejectButton", "cancelButton"]

  accept() {
    console.log(this.acceptButtonTarget)
  }

  reject(event) {
    console.log(event)
  }

  cancel(event) {
    console.log(event)
  }
}
