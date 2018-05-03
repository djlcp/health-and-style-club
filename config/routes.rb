Rails.application.routes.draw do

  devise_for :users
  resources :posts
  resources :subscriptions

  scope '/subscriptions', :controller => :subscriptions do
    post :subscription_created_callback
  end

  scope '/admin' do
    resources :users
  end
  resources :posts
  resources :invoices
  root to: 'home#index'

  resources :masterclasses, :videos, :events, :documents
end
