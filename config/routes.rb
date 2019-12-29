Rails.application.routes.draw do
  devise_for :users
  root 'home#home'
  get "home/about" => "home#about"
end
