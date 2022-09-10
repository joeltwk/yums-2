Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "my-account", to: "pages#profile"
  get "search", to: "pages#search"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants do
    resources :reviews, only: [:index, :new, :create]
    resources :favourites, only: [:new, :create]
  end
  resources :users, only: %i[show update] do
    resources :friends, only: %i[index new create show]
    resources :followers, only: %i[index]
    resources :favourites, only: [:show, :index]
    get "restaurants", to: "restaurants#restaurants"
  end
  resources :friends, only: [:destroy]
  resources :reviews, only: %i[show edit update]
  resources :favourites, only: [:destroy]
  resources :collections, only: [:destroy]
end
