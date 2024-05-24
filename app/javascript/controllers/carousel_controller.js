import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	
	initialize() {
		this.currentIndex = 0;
		this.imageCount = this.element.children.length;
		this.paused = false;
		this.startCarousel();
	}
	
	connect() {
		document.addEventListener('click', this.handleDocumentClick.bind(this));
	}
	
	disconnect() {
		document.removeEventListener('click', this.handleDocumentClick.bind(this));
		clearInterval(this.interval);
	}
	
	startCarousel() {
		this.interval = setInterval(() => {
			if (!this.paused) {
				this.nextImage();
			}
		}, 3000); // Change image every 3 seconds
	}
	
	nextImage() {
		this.currentIndex = (this.currentIndex + 1) % this.imageCount;
		this.updateCarousel();
	}
	
	updateCarousel() {
		const offset = this.currentIndex * this.element.clientWidth;
		this.element.scrollTo({
			left: offset,
			behavior: 'smooth'
		});
	}
	
	handleDocumentClick(event) {
		if (this.element.contains(event.target)) {
			this.pauseCarousel();
		} else {
			this.resumeCarousel();
		}
	}
	
	pauseCarousel() {
		this.paused = true;
	}
	
	resumeCarousel() {
		this.paused = false;
	}
}
