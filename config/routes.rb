Rails.application.routes.draw do
  devise_for :users
  root 'home#home'
  get "home/about"

  resources :users, only: [:index, :edit, :show, :new, :destroy]
  resources :books, only: [:index, :edit, :show, :create, :destroy]

end
