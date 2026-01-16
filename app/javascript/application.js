// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', () => {
  const togglePassword = document.querySelector('#toggle-password');
  const passwordField = document.querySelector('#password-field');
  const eyeIcon = document.querySelector('#eye-icon');

  togglePassword.addEventListener('click', () => {
    // Alterna o tipo de input
    const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordField.setAttribute('type', type);
    
    // Alterna o ícone (precisa do FontAwesome)
    eyeIcon.classList.toggle('fa-eye');
    eyeIcon.classList.toggle('fa-eye-slash');
  });
});