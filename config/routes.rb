Rails.application.routes.draw do

  devise_for :users
  resources :posts

  scope '/subscriptions', :controller => :subscriptions do
    post :subscription_created_callback
  end

  resources :subscriptions


  scope '/admin' do
    resources :users
  end
  resources :posts
  resources :invoices
  root to: 'home#index'

  resources :masterclasses, :videos, :events, :documents
end
