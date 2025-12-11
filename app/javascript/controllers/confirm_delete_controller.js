import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "name", "form"]

  open(event) {
    event.preventDefault()

    this.url = event.currentTarget.getAttribute("href")
    this.nameTarget.textContent = event.currentTarget.dataset.name

    this.modalTarget.classList.remove("hidden")
    this.modalTarget.classList.add("fade-in")
  }

  close() {
    this.modalTarget.classList.remove("fade-in")
    this.modalTarget.classList.add("fade-out")

    setTimeout(() => {
      this.modalTarget.classList.add("hidden")
      this.modalTarget.classList.remove("fade-out")
    }, 200)
  }

  confirm() {
    this.formTarget.action = this.url
    this.formTarget.submit()
  }
}
