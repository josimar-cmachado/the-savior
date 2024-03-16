// import { Controller } from "@hotwired/stimulus"
//
// Connects to data-controller="wedding-event"
// export default class extends Controller {
  // static targets = ["titleElement", "cardElement"]
//
  // connect() {
    // console.log("hello from display controller ")
  // }
//
  // change() {
    // this.titleElementTarget.classList.toggle('d-none');
    // this.cardElementTarget.classList.toggle('d-none');
    // console.log("hello from ")
  // }
// }


import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["hiddenElement"];

  connect() {
    console.log("Elemento visível");
    const observer = new IntersectionObserver((elements) => {
      elements.forEach((element) => {
        if (element.isIntersecting) {
          console.log("Elemento visível");
          this.hiddenElementTarget.style.display = ""; // Mostra o elemento
        }
      });
    });

    observer.observe(this.hiddenElementTarget);
    console.log(observer)
  }
}
