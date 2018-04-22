Rails.application.routes.draw do

  get 'home/index'

  devise_for :users
  resources :posts
  resources :subscriptions



  root to: 'home#index'


end
