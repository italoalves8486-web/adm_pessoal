Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :pessoas
  get "home", to: "home#index"
  get "cadastro", to: "pessoas#new"
  get "sobre", to: "home#sobre"
end
