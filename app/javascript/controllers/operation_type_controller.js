import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]
  static values = { open: Boolean }

  toggle(event) {
    this.openValue = !this.openValue
  }

  toggle_enabled(element, opened) {
    const inputs = element.getElementsByTagName("input");

    for (var i = 0; i < inputs.length; i++) {
      inputs[i].disabled = !opened;
      inputs[i].classList.toggle("border-gray-300", !opened);
      inputs[i].classList.toggle("grey", !opened);

      // if input is a checkbox, change the color property
      if (inputs[i].type == "checkbox") {
        inputs[i].style.color = opened ? "" : "rgb(209 213 219/var(--tw-border-opacity))";
      }
    }

    element.classList.toggle("text-gray-900", opened);
    element.classList.toggle("text-gray-400", !opened);
  }

  openValueChanged() {
    this.toggle_enabled(this.menuTarget, this.openValue)
  }
}
