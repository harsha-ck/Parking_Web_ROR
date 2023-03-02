Rails.application.routes.draw do

       root "customer#new"


     resources :spots
     resources :customer
     resources :users
     get '/customer/show/details', to: 'customer#details'
     get '/report', to: 'customer#report'

     get '/customer/check/out', to: 'customer#checkout'
     post '/customer/check/out', to: 'customer#checkout'
     get "/login", to: "users#login", as: "login"
     post "/login", to: "users#login"
     get "/logout", to: "users#delete", as: "logout"
     get "/forgot", to: "users#forgot"
     post "/forgot", to: "users#forgot"
     get "/reset/:id/edit", to: "users#reset", as: "reset"
     post "/reset/:id/edit", to: "users#passedit"

end
