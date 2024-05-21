import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "menu", "button", "menuIcon", "closeIcon" ]
  initialize() {
    this.buttonTarget.addEventListener("click", () => {
      this.toggleMenu()
      this.toggleHamburger()
    })
  }

  toggleHamburger() {
    this.menuIconTarget.classList.toggle("hidden")
    this.closeIconTarget.classList.toggle("hidden")
  }

  toggleMenu() {
    this.menuTarget.classList.toggle("hidden")
    this.menuTarget.classList.toggle("md:hidden")

  }
}
