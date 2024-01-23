import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
   static targets = ['tile']

   initialize() {
      this.photos = shuffleArray(this.tileTargets)
   }
   
   connect() {
      this.tile()
   }

   tile() {
      // remove all tiles
      this.clear_base()

   }

   clear_base() {
      this.photos.forEach(photo => {
         console.log(photo)
         photo.remove()
         this.element.append(photo)
      });
   }
}

function shuffleArray(array) {
   for (let i = array.length - 1; i > 0; i--) {
     const j = Math.floor(Math.random() * (i + 1));
     [array[i], array[j]] = [array[j], array[i]];
   }
   return array;
 }
 