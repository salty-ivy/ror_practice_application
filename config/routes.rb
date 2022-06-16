Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#home"
  # resources :articles
  get "/test", to: "articles#test"
  get "/articles", to: "articles#index"
  get "/articles/new", to: "articles#new"
  get "/articles/:id", to: "articles#show", as: "article"
  post "/articles", to: "articles#create"
  get "/articles/:id/edit", to: "articles#edit", as: "edit_article"
  patch "/articles/:id", to: "articles#update"
  put "/articles/:id", to: "articles#update"


  get "/singup", to: "users#new"
  post "/sign_in", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/users/:id", to: "users#show", as:"user"

  # resources :article

end
