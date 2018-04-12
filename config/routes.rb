Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  devise_for :installs
  devise_for :models

  root to: 'home#index'

end
