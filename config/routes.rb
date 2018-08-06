Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resource :user

  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!STANDARD!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  get 'faq' => 'pages#faq'
  get 'home' => 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'termsandconditions' => 'pages#t_c_page'
  get 'privacy-policy' => 'pages#privacy_policy'
  get 'our-masterclasses' => 'pages#masterclasses'
  get 'personal-styling' => 'pages#personal_styling'
  get 'become_contributor' => 'pages#become_contributor'
  get 'personal-development' => 'pages#personal_development'
  get 'fitness-and-nutrition' => 'pages#fitness_and_nutrition'

  # resources :photos # TODO: REMOVE RESOURCE
  # resources :contents # TODO: REMOVE RESOURCE
  # resources :comments # TODO: REMOVE RESOURCE
  resources :posts
  resources :attachments
  resources :categories
  resources :contacts, only: %i[new create]
  resources :masterclasses

  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!MEMBERS!!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  namespace :members do
    root to: 'masterclasses#index'
    resource :user
    resources :collections, only: [:show]
    resources :masterclasses, only: %i[index show]
    resources :users_collections, only: [:update]

    # LINKS TO MEMBERS CLUB
    resource :members_club, controller: 'members_club' do
      get :workout
      get 'personal-styling', to: :personal_styling
      get 'personal-development', to: :personal_development
      get :recipes
      get 'member-orientation', to: :member_orientation
    end

    # LIKE AND DISLIKE POSTS
    resources :posts, only: %i[index show] do
      member do
        put 'like', to: 'posts#upvote'
        put 'dislike', to: 'links#downvote'
      end
    end
  end

  namespace :contributors do
    root to: 'masterclasses#index'
    resource :user
    resources :collections, only: [:show]
    resources :masterclasses, only: %i[index show]
    resources :users_collections, only: [:update]

    # LINKS TO MEMBERS CLUB
    resource :members_club, controller: 'members_club' do
      get :workout
      get 'personal-styling', to: :personal_styling
      get 'personal-development', to: :personal_development
      get :recipes
      get 'member-orientation', to: :member_orientation
    end

    # LIKE AND DISLIKE POSTS
    resources :posts, only: %i[index show] do
      member do
        put 'like', to: 'posts#upvote'
        put 'dislike', to: 'links#downvote'
      end
    end
  end
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!ADMINS!!!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  namespace :admins do
    root to: 'collections#index'
    resources :collections
    resources :masterclasses
    resources :posts
  end

  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!CK EDITOR!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  mount Ckeditor::Engine => '/ckeditor'

  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!BILLING!!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  scope '/subscriptions', :controller => :subscriptions do
    post :webhook_callback
  end

  resources :subscriptions do
    get :new_sub, on: :collection
  end

  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!TO BE CHANGED!!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!TO BE CHANGED!!!!!!!!!!!!!!!# TODO:
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!TO BE CHANGED!!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
    root to: 'users#index'
  end
end
