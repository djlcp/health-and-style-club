Rails.application.routes.draw do

  get 'home/index'

  devise_for :users
  scope '/admin' do
    resources :users
  end
  resources :posts
  resources :invoices



  root to: 'users#index'


end
