Rails.application.routes.draw do

  get 'home/index'

  devise_for :users
  devise_for :installs
  devise_for :models
  resources :posts
  resources :masterclasses
  

  root to: 'home#index'


end
