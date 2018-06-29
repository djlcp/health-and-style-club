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
  resources :posts do
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

  # !!!!!!!!!!!!!STATIC PAGES!!!!!!!!!!!!!

  get '/faq' => 'pages#faq'

  get '/about' => 'pages#about'

  get '/privacy-policy' => 'pages#privacy_policy'

  get '/termsandconditions' => 'pages#t_c_page'

  get '/abouthealthandfitness' => 'pages#static_fitness'

  get '/aboutpersonalstyling' => 'pages#static_style'

  get '/aboutpersonaldevelopment' => 'pages#static_personal-dev'

  get '/aboutmasterclasses' => 'pages#static_masterclass'

  get '/become_contributor' => 'pages#become_contributor'

# !!!!!!!!!!!!!MEMBER CLUB PAGES!!!!!!!!!!!!!

get '/workoutvideos' => 'pages#workout_videos'

get '/personalstyling' => 'pages#personal_style'

get '/personaldevelopment' => 'pages#personal_development'

get '/recipes' => 'pages#recipes'

get '/memberorientation' => 'pages#member_orientation'
  

  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  #!!!!!!!!!!!!MASTERCLASSES!!!!!!!!!!!!
  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  resources :masterclasses, :videos, :events, :documents


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
