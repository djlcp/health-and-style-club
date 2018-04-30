Rails.application.routes.draw do

  devise_for :admins
  get 'users/index'

  devise_for :users
  resources :posts
  resources :subscriptions

  scope '/hooks', :controller => :hooks do
    post :subscription_created_callback
  end

  scope '/admin' do
    resources :users
  end
  resources :posts
  resources :invoices
  root to: 'home#index'
end
