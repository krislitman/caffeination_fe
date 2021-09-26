Rails.application.routes.draw do
  root to: "home#index"

  # Users
  get "/sign_up", to: "sign_up#new"
  get "/log_in", to: "log_in#new"
end
