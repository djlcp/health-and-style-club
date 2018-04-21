Rails.application.routes.draw do

  devise_for :admins
  get 'home/index'

  devise_for :users
  scope '/admin' do
    resources :users
  end
  resources :posts
  resources :invoices



  root to: 'home#index'


end
