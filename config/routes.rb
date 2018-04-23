Rails.application.routes.draw do



  devise_for :users
  devise_for :installs
  devise_for :models
  resources :posts, :masterclasses, :invoices


  root to: 'home#index'

end
