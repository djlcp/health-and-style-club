Rails.application.routes.draw do

  root to: 'pages#home'
  #GEM REQUIREMENTS
  mount Ckeditor::Engine => '/ckeditor'

  # External Pages
  get 'about' => 'pages#about'
  get 'become_contributor' => 'pages#become_contributor'
  # Currently not being used
  get 'faq' => 'pages#faq'
  get 'fitness-and-nutrition' => 'pages#fitness_and_nutrition'
  get 'our-masterclasses' => 'pages#masterclasses'
  get 'personal-development' => 'pages#personal_development'
  get 'personal-styling' => 'pages#personal_styling'
  get 'privacy-policy' => 'pages#privacy_policy'
  get 'termsandconditions' => 'pages#t_c_page'

  # Members area
  namespace :members do
    root to: 'masterclasses#index'
    resources :collections, only: [:show]
    resources :masterclasses, only: %i[index show]
    resource :members_club, controller: 'members_club' do
      get :workout
      get 'personal-styling', to: :personal_styling
      get 'personal-development', to: :personal_development
      get :recipes
      get 'member-orientation', to: :member_orientation
    end
    resources :users_collections, only: [:update]
  end

  namespace :admins do
    root to: 'collections#index'
    resources :collections
    resources :masterclasses
    resources :posts, only: %i[index new create edit update destroy]
  end

  resources :photos
  resources :photos, only: [:create]
  resources :posts, only: %i[index show] do
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "links#downvote"
    end
  end
  resources :contents
  resources :comments
  resources :posts_contents
  resources :attachments
  resources :contacts, only: [:new, :create]
  resources :categories

  # !!!!!!!!!!!!! MEMBERS PAGE !!!!!!!!!!!!!

  get 'members' => 'pages#members'
  get '/members/:id', to: 'pages#members_profile'
  get '/member_home' => 'pages#member_home'

  # resources :masterclasses, :videos, :events, :documents

  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  #!!!!!!!!!!!USER MANAGEMENT!!!!!!!!!!!
  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  devise_for :users
  resource :user
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
    resources :serversettings
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
