import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ 'form', 'content', 'button' ]

    initialize() {
        
        this.contentTarget.addEventListener("click", () => {
            this.toggleFormAndContent()
        });

        this.buttonTargets.forEach(btn => {
            btn.addEventListener("click", () => {
                this.toggleFormAndContent()
            });
        });
    };

    toggleFormAndContent() {
        this.formTarget.classList.toggle("hidden")
        this.contentTarget.classList.toggle("hidden")
    }
};