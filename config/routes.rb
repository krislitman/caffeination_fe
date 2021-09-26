Rails.application.routes.draw do
  root to: "home#index"

  resources :sign_up, only: [:create]
  resources :log_in, only: [:create]
end
