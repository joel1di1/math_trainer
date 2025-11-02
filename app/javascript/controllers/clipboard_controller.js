import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button"]
  static values = { text: String }

  copy(event) {
    event.preventDefault()

    navigator.clipboard.writeText(this.textValue).then(() => {
      // Show success feedback
      const originalText = this.buttonTarget.textContent
      this.buttonTarget.textContent = "Copied!"
      this.buttonTarget.classList.add("bg-green-600")
      this.buttonTarget.classList.remove("bg-blue-600")

      setTimeout(() => {
        this.buttonTarget.textContent = originalText
        this.buttonTarget.classList.remove("bg-green-600")
        this.buttonTarget.classList.add("bg-blue-600")
      }, 2000)
    }).catch(err => {
      console.error('Failed to copy:', err)
    })
  }

  connect() {
    this.buttonTarget.addEventListener('click', this.copy.bind(this))
  }
}
