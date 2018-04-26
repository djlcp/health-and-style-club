Rails.application.routes.draw do
	
	root to: 'pages#home'
	get :contact, to: 'pages#contact'
  devise_for :admins
  get 'users/index'
  devise_for :users
  scope '/admin' do
    resources :users
  end
  resources :posts
  resources :invoices
end
