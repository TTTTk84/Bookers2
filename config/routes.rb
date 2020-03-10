Rails.application.routes.draw do
  devise_for :users
  root 'home#home'
  get "home/about"

  resources :users, only: [:index, :edit, :show, :update, :destroy]

  resources :books, only: [:index, :edit, :show, :update, :create, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resource :book_comments, only: [:create, :destroy]
  end

end
