Rails.application.routes.draw do
# <<<<<<< HEAD
	
# 	root to: 'pages#home'
# 	get :contact, to: 'pages#contact'
#   devise_for :admins
#   get 'users/index'
# =======

# >>>>>>> develop
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
