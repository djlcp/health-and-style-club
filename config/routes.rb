Rails.application.routes.draw do

  get 'home/index'

  devise_for :users
  resources :posts
  resources :subscriptions

  scope '/hooks', :controller => :hooks do
    post :subscription_created_callback
  end

  root to: 'home#index'


end
