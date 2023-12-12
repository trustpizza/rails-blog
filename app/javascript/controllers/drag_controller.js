import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this)
    })
  }

  end(event) {
    let id = event.item.dataset.id
    let data = new FormData();
    let url = this.data.get("url").replace(":id", id)
    data.append("position", event.newIndex + 1)

    const parent = this.element
    const post_element_items = Array.from(parent.children)

    const post_elements = post_element_items.map((ele, idx) => {
      return { id: ele.dataset.id, position: idx + 1}
    })
    
    element.dataset.elements = JSON.stringify(post_elements)
  }
}
