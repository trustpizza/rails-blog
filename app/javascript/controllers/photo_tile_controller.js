import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
   static targets = ['tile']
   initialize() {
      console.log(this.tileTargets)
   }
}
  