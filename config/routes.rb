Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :users, only: [:show]
  resources :reviews, only: [:show, :edit, :update]
end
