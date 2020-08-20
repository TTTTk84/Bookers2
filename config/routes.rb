Rails.application.routes.draw do
  devise_for :users
  root 'home#home'
  get "home/about"
  get "search" => "search#search"

  resources :users, only: [:index, :edit, :show, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follows'
    get 'followers' => 'relationships#followers'
  end

  resources :books, only: [:index, :edit, :show, :update, :create, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resource :book_comments, only: [:create, :destroy]
  end

end
