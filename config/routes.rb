Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "api/post/create", to: "posts#create"
  get "api/index", to: "posts#index"
  post "api/validate", to: "posts#validate"
  delete "api/destroy", to: "posts#destroy"

 post "api/create", to: "users#create"
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
