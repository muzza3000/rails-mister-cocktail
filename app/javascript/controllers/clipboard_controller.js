import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["source"]

  connect() {
    if (document.queryCommandSupported("copy")) {
      this.element.classList.add("clipboard--supported")
    }
  }

  pasteIndex() {
    let index = this.data.get('index');
    this.sourceTarget.value = index
  }

  copy() {
    this.sourceTarget.select()
    document.execCommand("copy")
  }
}