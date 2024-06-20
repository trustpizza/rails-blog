import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["targetImage", "sourceImage", "modal"]
  
  connect() {
    this.sourceImageTargets.forEach(img => {
      img.addEventListener("click", () => {
        this.openModal(img);
      })
    });
  }

  openModal(targetImage) {
    this.modalTarget.classList.toggle("hidden");
    this.targetImageTarget.src = targetImage.src;
  }

  closeModal() {
    this.modalTarget.classList.toggle('hidden');
  }

}