Rails.application.routes.draw do


  resources :photos 
  devise_for :users
  resources :posts

  scope '/subscriptions', :controller => :subscriptions do
    post :webhook_callback
  end

  resources :subscriptions
  resources :photos, only: [:create]

  resources :attachments

  resources :subscriptions do
    get :new_sub, on: :collection
  end


  scope '/admin' do
    resources :users
  end
  resources :posts
  resources :invoices

  root to: 'pages#home'

  resources :masterclasses, :videos, :events, :documents
end
