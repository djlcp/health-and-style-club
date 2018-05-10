Rails.application.routes.draw do

  devise_for :users
  resources :posts

  scope '/subscriptions', :controller => :subscriptions do
    post :webhook_callback
  end

  resources :subscriptions do
    get :new_sub, on: :collection
  end


  scope '/admin' do
    resources :users
  end
  resources :posts
  resources :invoices
  root to: 'home#index'

  resources :masterclasses, :videos, :events, :documents
end
