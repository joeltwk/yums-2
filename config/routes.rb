Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "my-account", to: "pages#profile"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants
  resources :users, only: [:show]
end
