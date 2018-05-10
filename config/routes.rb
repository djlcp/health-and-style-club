Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

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

  root to: 'pages#home'

  resources :masterclasses, :videos, :events, :documents
end
