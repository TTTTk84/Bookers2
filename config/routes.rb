Rails.application.routes.draw do
  devise_for :users
  get "/" => "home#home"
  get "home/about" => "home#about"
end
