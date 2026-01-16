import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.applyMask()
  }

  applyMask() {
    this.element.addEventListener('input', (e) => {
      let v = e.target.value.replace(/\D/g, "") // Remove tudo que não é número
      
      v = v.replace(/^(\d{2})(\d)/g, "($1) $2") // Coloca (DD) 
      v = v.replace(/(\d{5})(\d)/, "$1-$2")    // Coloca o hífen 12345-6789
      
      e.target.value = v.substring(0, 15)      // Limita o tamanho
    })
  }
}