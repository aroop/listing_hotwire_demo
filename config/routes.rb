Rails.application.routes.draw do
  resources :users
  resources :listings do
    resource :likes, only: [:create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "about", to: "static#about"
  # Defines the root path route ("/")
  root "listings#index"
end
