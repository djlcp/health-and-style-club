Rails.application.routes.draw do

  root to: 'pages#home'

  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  #!!!!!!!!!GEM REQUIREMENTS!!!!!!!!!!!!
  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  mount Ckeditor::Engine => '/ckeditor'


  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  #!!!!!!!!!!!!!!GENERAL!!!!!!!!!!!!!!!!
  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  resources :photos
  resources :photos, only: [:create]
  resources :posts
  resources :contents
  resources :comments
  resources :posts_contents
  resources :attachments
  resources :contacts, only: [:new, :create]

# !!!!!!!!!!!!!MEMBERS PAGE!!!!!!!!!!!!!

  get 'members' => 'pages#members'
  get '/members/:id', to: 'pages#members_profile'


  # !!!!!!!!!!!!!FAQ PAGE!!!!!!!!!!!!!

  get '/faq' => 'pages#faq'


  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  #!!!!!!!!!!!!MASTERCLASSES!!!!!!!!!!!!
  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  resources :masterclasses, :videos, :events, :documents


  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  #!!!!!!!!!!!USER MANAGEMENT!!!!!!!!!!!
  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  devise_for :users
  get 'users/password_update' => 'users#password_update'
  namespace :admin do
    resources :users
    # resources :contents
    # resources :documents
    # resources :events
    resources :masterclasses
    resources :posts
    resources :comments
    # resources :posts_contents
    resources :subscriptions
    resources :categories
    # resources :videos
    root to: "users#index"
  end



  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  #!!!!!!!!!!!!!!!BILLING!!!!!!!!!!!!!!!
  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  scope '/subscriptions', :controller => :subscriptions do
    post :webhook_callback
  end

  resources :subscriptions do
    get :new_sub, on: :collection
  end


end
