Rails.application.routes.draw do

	root to: 'pages#home'
	get :contact, to: 'pages#contact'

  devise_for :users
  devise_for :installs
  devise_for :models
  resources :posts
  resources :invoices
end
