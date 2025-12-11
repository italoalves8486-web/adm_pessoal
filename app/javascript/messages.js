document.addEventListener('DOMContentLoaded', function() {
    // 5000 milissegundos = 5 segundos
    const TEMPO_PARA_SUMIR = 5000; 
    const messages = document.querySelectorAll('.flash-message');

    messages.forEach(function(msg) {
        setTimeout(function() {
            // Inicia a transição CSS de 1.5s
            msg.classList.add('hidden');
            
            // Remove o elemento do DOM após a transição
            setTimeout(() => msg.remove(), 1600); 
        }, TEMPO_PARA_SUMIR);
    });
});