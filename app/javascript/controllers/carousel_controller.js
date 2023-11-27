import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "slide", "button" ]
  static values = {
    index: Number,
    maximum: Number,
  }


  
  initialize () {
    this.maximum = this.slideTargets.length // Max number before reset
    this.index = 0

    setInterval(() => {
        this.next()
    }, 1000 * 2.5)
    /*
    Ways I can properly slide to the right slide:
      I can swipe a 1/4 of the length of the screen every few moments on "next"
      Do the opposite on previous
    */
  }
  
  showCurrentSlide() {
    const cur_ele = document.getElementById(`slide_${this.index}`)
    console.log(cur_ele)
    cur_ele.scrollIntoView({behavior: "smooth"})
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
