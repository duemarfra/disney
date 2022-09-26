Rails.application.routes.draw do
  root "security#index"
  resources :genres
  resources :movies
  resources :personages
  get "security", to: "security#index"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create", as: "log_in"
  delete "logout", to: "sessions#destroy"

  get "password", to: "passwords#edit", as: "edit_password"
  patch "password", to: "passwords#update"
end
