Rails.application.routes.draw do

  get 'activities/new' => 'activities#new'
  #get 'activities/:id' => 'activities#show'
  post 'activities/new' => 'activities#create'
  post 'activities/edit' => 'activities#edit'
  put 'activities/edit.:id' => 'activities#update'
  post 'activities/like_activity'
  post 'activities/dislike_activity' 
  get 'activities/destroy' => 'activities#destroy'
  delete 'activities/destroy' => 'activities#destroy'
  #get 'activities/edit'
  #problem: when i go to activities/new it now thinks that new is the id
  #get 'new_activity' => 'activities/new' 
  
  post 'pages/like_activity' => 'activities/like_activity'
  post 'pages/dislike_activity' => 'activities/dislike_activity'
  post 'pages/like_profile' => 'users/like_profile'
  post 'pages/dislike_profile' => 'users/dislike_profile'
  get  'pages/home_activity_perspective' => 'pages#home_activity_perspective'
  get  'pages/home' => 'pages#home'
  get 'users/show'

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'pages#home', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end 
	#resources :users, only: [:show, :edit, :update] 
  #resources :activities_index_path
  #resources :activities, only: [:show, :new, :create, :update]
  resources :users, only: [:show, :edit, :update] do
    resources :activities, only: [:show, :new, :create, :update] do
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
