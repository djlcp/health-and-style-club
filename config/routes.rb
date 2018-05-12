Rails.application.routes.draw do

  namespace :admin do
    resources :users
    # resources :contents
    # resources :documents
    # resources :events
    resources :masterclasses
    resources :posts
    # resources :post_contents
    # resources :subscriptions
    # resources :videos
  root to: "users#index"
  end

    root to: 'pages#home'

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users
  resources :posts
  resources :subscriptions
  resources :masterclasses, :videos, :events, :documents
  resources :invoices
  resources :comments


  scope '/hooks', :controller => :hooks do
    post :subscription_created_callback
  end

end
