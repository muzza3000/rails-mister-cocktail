import { Controller } from "stimulus"

console.log("hello from stimuls");

export default class extends Controller {
  static targets = ['content']

  connect() {
    console.log("Connected:", this.element);
    console.log("This is the content target", this.contentTarget);
    console.log(this.data.get('index'))
  }

  disconnect() {
    console.log("DISCONNECTED!")
  }

  sayHello() {
    debugger
    this.data.set('index',52);
    console.log(this.data.get('index'));
    this.contentTarget.innerHTML = "Data set to 52";
  }
}
