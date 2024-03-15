// controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["togglableElement", "togglableElementChoiceCasamento", "togglableElementChoiceDados", "btnCasamento", "btnDados"];

  connect() {
    if (this.element.dataset.fireCasamentoInfo !== undefined) {
      this.fireCasamentoInfo();
    } else if (this.element.dataset.firePresentesInfo !== undefined) {
      this.firePresentesInfo();
    } else if (this.element.dataset.fireConvidadosInfo !== undefined) {
      this.fireConvidadosInfo();
    } else if (this.element.dataset.firePresentesRecebidos !== undefined) {
      this.firePresentesRecebidos();
    } else if (this.element.dataset.fireDados !== undefined) {
      this.fireDados();
    } else if (this.element.dataset.fireAmor !== undefined) {
      this.fireAmor();
    }
  }

  fireCasamentoInfo() {
    this.toggleVisibility("casamentoInfo");
  }

  firePresentesInfo() {
    this.toggleVisibility("presentesInfo");
  }

  fireConvidadosInfo() {
    this.toggleVisibility("convidadosInfo");
  }

  firePresentesRecebidos() {
    this.toggleVisibility("presentesRecebidos");
  }

  fireDados() {
    this.toggleVisibility("dados");
  }

  fireUserInfo() {
    this.toggleVisibility("userInfo");
  }

  fireAmor() {
    this.toggleVisibility("amor");
  }

  toggleVisibility(type) {
    this.togglableElementTargets.forEach(target => {
      if (target.dataset.toggleElement === type) {
        target.classList.remove("d-none");
      } else {
        target.classList.add("d-none");
      }
    });
  }

  fireChoiceCasamento() {
    this.togglableElementChoiceDadosTarget.classList.add("d-none");
    this.togglableElementChoiceCasamentoTarget.classList.remove("d-none");
    this.firePresentesRecebidos();
    this.fireConvidadosInfo();
    this.firePresentesInfo();
    this.fireCasamentoInfo();
  }

  fireChoiceDados() {
    this.togglableElementChoiceCasamentoTarget.classList.add("d-none");
    this.togglableElementChoiceDadosTarget.classList.remove("d-none");
    this.fireAmor();
    this.fireUserInfo();
    this.fireDados();
  }
}
