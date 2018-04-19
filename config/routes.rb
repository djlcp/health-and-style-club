Rails.application.routes.draw do

  get 'home/index'

  devise_for :users
  resources :posts
  resources :invoices



  root to: 'home#index'


end
