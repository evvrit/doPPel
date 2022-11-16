import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["acceptButton", "rejectButton"]

  connect() {
    console.log("Hello from our first Stimulus controller")
  }
}
