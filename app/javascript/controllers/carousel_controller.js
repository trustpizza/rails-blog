import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "slide", "button" ]
  static values = {
    index: Number,
    default: 0
  }


  
  initialize () {
    this.index = this.indexValue
    // setInterval(() => {
    //     this.next()
    // }, 1000 * 2.5)
    /*
    Ways I can properly slide to the right slide:
      I can swipe a 1/4 of the length of the screen every few moments on "next"
      Do the opposite on previous
    */
  }
  
  showCurrentSlide() {
    // this.slideTargets.forEach((slide, i) => {
    //   slide.classList.toggle("active", i !== this.index)
    // });
    
    // this.buttonTargets.forEach((button, i) => {
    //   // button.toggleAttribute("active")
    //   button.classList.toggle("active", i !== this.index)
    // })
    
  }

  swipeRight() {

  }
  
  next() {
    if ((this.index + 1) > (this.slideTargets.length - 1)) {
      this.index = 0
    } else {
      this.index++
    }
    
    this.showCurrentSlide()
  }
  
  previous() {
    if ((this.index -1 ) < 0) {
      this.index = this.slideTargets.length - 1
    } else {
      this.index--
    }
    
    this.showCurrentSlide()
  }
}
