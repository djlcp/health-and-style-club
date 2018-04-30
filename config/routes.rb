Rails.application.routes.draw do

  devise_for :admins
  get 'users/index'

  devise_for :users
<<<<<<< HEAD
  resources :posts
  resources :subscriptions

  scope '/hooks', :controller => :hooks do
    post :subscription_created_callback
  end

=======
  scope '/admin' do
    resources :users
  end
  resources :posts
  resources :invoices
>>>>>>> develop
  root to: 'home#index'
end
