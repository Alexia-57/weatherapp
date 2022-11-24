Rails.application.routes.draw do
  get 'home/zipcode'
  root 'home#index'

  post "zipcode" => 'home#zipcode'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
