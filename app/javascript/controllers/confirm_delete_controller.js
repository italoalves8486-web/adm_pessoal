import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "modal" ]

  // Abre o modal
  open(event) {
    event.preventDefault()
    this.modalTarget.style.display = 'flex'
  }

  // Fecha o modal
  close(event) {
    if (event) event.preventDefault()
    this.modalTarget.style.display = 'none'
  }

  // Fecha se clicar fora da caixa branca
  clickOutside(event) {
    if (event.target === this.modalTarget) {
      this.close()
    }
  }
}