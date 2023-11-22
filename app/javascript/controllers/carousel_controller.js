import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "slide" ]
    
    click() {
        console.log(this.slideTarget)
    }
}
