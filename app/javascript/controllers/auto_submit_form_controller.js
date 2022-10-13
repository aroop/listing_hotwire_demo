import {Controller} from "@hotwired/stimulus"
import debounce from "debounce"

// Connects to data-controller="auto-submit-form"
export default class extends Controller {
  initialize() {
    console.log("AutoSubmitFormController#initialize")
    // Debounce the submitForm method to prevent multiple requests
    this.submitForm = debounce(this.submitForm.bind(this), 300)
    // Hide the submit button
    this.element.querySelector('input[type=submit]').style.display = "none"
  }

  connect() {
    console.log("AutoSubmitFormController#connect")
  }

  disconnect() {
    console.log("AutoSubmitFormController#disconnect")
  }

  submitForm(_event) {
    console.log("AutoSubmitFormController#submitForm")
    // Submit the form
    this.element.requestSubmit();
  }
}
