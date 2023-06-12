import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // Controllerに取り付けられているDOMを削除
  remove() {
    this.element.remove()
  }
}
