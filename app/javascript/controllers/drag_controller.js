import { Controller } from "@hotwired/stimulus"
import Rails from '@rails/ujs';
import Sortable from "sortablejs"

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this)
    })
  }

  end(event) {
    let id = event.item.dataset.id
    let postId = event.item.dataset.postId

    let data = new FormData()
    data.append("position", event.newIndex + 1)
    console.log(event.newIndex + 1)
    console.log(id)
    let urlTemplate = this.data.get("url")
    let url = urlTemplate.replace(":post_id", postId).replace(":id", id)

    Rails.ajax({
      url: url,
      type: 'PATCH',
      data: data
    })
  }

  // end(event) {
  //   let id = event.item.dataset.id
  //   let postId = event.item.dataset.postId

  //   let data = new FormData()
  //   data.append("position", event.newIndex + 1)

  //   let url = this.data.get("url")
  //   let mappedUrl = { "id": id, ":":""}

  //   url = url.replace(/post_id|id/gi, function(matched){
  //     return mappedUrl[matched];
  //   })

  //   url = url.replaceAll(":","")

  //   Rails.ajax({
  //     url: url,
  //     type: 'PATCH',
  //     data: data
  //   })
  // }
}
