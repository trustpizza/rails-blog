import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ 'form', 'content', 'cancelButton', 'saveButton' ]

    initialize() {
        this.currentTarget = this.formTarget;

        this.element.addEventListener("click", () => {
            this.currentTarget = this.currentTarget == this.formTarget ? this.contentTarget : this.formTarget;
        });

        this.contentTarget.addEventListener("click", () => {
            this.toggleForm();
        });

        this.saveButtonTarget.addEventListener("click", () => {
            this.toggleForm();
            this.toggleContent();
        });

        this.cancelButtonTarget.addEventListener("click", () => {
            this.toggleForm();
            this.toggleContent();
        })
    };

    toggleForm() {
        this.formTarget.classList.toggle("hidden");
    };

    toggleContent() {
        this.contentTarget.classList.toggle("hidden")
    }
};