Rails.application.routes.draw do

      root "spots#index"


     resources :spots
     resources :customer
     resources :users
     get '/customer/show/details', to: 'customer#details'

     get '/customer/check/out', to: 'customer#checkout'
     post '/customer/check/out', to: 'customer#checkout'
     get "/login", to: "users#login", as: "login"
     post "/login", to: "users#login"
     get "/logout", to: "users#delete", as: "logout"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
