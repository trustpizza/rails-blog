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
    let data = new FormData()
    data.append("position", event.newIndex + 1)

    Rails.ajax({
      url: this.data.get("url").replace(":id", id).replace(":post_id", "1"),
      type: 'PATCH',
      data: data
    })
  }
}
