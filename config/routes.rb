Rails.application.routes.draw do
  root to: "home#index"

  # Users
  get "/sign_up", to: "sign_up#new"
  post "/sign_up", to: "sign_up#create"
  get "/log_in", to: "sessions#new"
  post "/log_in", to: "sessions#create"
  delete "/log_out", to: "sessions#destroy"

  # Search
  get "/search", to: "search#index"
end
