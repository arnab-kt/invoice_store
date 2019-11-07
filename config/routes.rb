Rails.application.routes.draw do

  namespace :admin do
    resources :countries, except: [:show]
  end
  get "profile", to: "home#show", as: "profile"
  get "login", to: redirect("/auth/google_oauth2"), as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
