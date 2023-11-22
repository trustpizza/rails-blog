import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "parent", "slide" ]
    
    clickRight() {
        console.log(this.parentTarget)
    }
}
