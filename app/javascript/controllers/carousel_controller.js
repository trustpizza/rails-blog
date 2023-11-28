import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "slide", "button" ]
  static values = {
    index: Number,
    maximum: Number,
    swiperSeconds: Number
  }
  
  initialize () {
    this.maximum = this.slideTargets.length // Max number before reset
    this.index = 0  
    this.swiperSeconds = 2.5 // Default val for timer to wait before swipes (seconds)
    this.createTimer()
  }

  createTimer() {
    let timer;

    timer = setInterval(() => {
      this.next();
    }, 1000 * this.swiperSeconds);
    
    const resetTimer = () => {
      clearInterval(timer);
      
      timer = setInterval(() => {
        this.next();
      }, 1000 * this.swiperSeconds);
    }

    const timerResetEvents = ["mousemove", "touchstart"]

    timerResetEvents.forEach(event => {
      document.addEventListener(event, () => {
        resetTimer()
      })
    });

  }
  
  getCurrentEle() {
    for (let i = 0; i < this.maximum; i++) {
      const element = document.getElementById(`slide_${i}`);
      if (this.isInViewport(element)) {
        this.index = i
        break
      }
    }
  }
  
  isInViewport(element) {
    const rect = element.getBoundingClientRect();
    return (
      rect.top >= 0 &&
      rect.left >= 0 &&
      rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
      rect.right <= (window.innerWidth || document.documentElement.clientWidth)
      );
  }
  
  
  showCurrentSlide() {
    const cur_ele = document.getElementById(`slide_${this.index}`)
    cur_ele.scrollIntoView({behavior: "smooth"})
  }
  
  next() {
    this.getCurrentEle()
    
    if ((this.index + 1) > (this.maximum- 1)) {
      this.index = 0
    } else {
      this.index++
    }
    
    this.showCurrentSlide()
  }
}
  