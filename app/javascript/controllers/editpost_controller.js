import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ 'form', 'content', 'button' ]

    initialize() {

        this.contentTarget.addEventListener("click", () => {
            this.toggleForm();
        });

        this.buttonTargets.forEach(btn => {
            btn.addEventListener("click", () => {
                this.toggleForm();
                this.toggleContent();
            });
        });
    };

    toggleForm() {
        this.formTarget.classList.toggle("hidden");
    };

    toggleContent() {
        this.contentTarget.classList.toggle("hidden")
    }
};