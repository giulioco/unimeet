Rails.application.routes.draw do

  get 'activities/new' => 'activities#new'
  get 'activities/:id' => 'activities#show'
  #get 'activities/edit'
  #problem: when i go to activities/new it now thinks that new is the id
  #get 'new_activity' => 'activities/new' 
  get 'activities/show'
  post 'activities/like_activity'
  post 'activities/dislike_activity' 
  post 'pages/like_activity' => 'activities/like_activity'
  post 'pages/dislike_activity' => 'activities/dislike_activity'

  #get 'users/show'

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'pages#home', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end 
	resources :users, only: [:show, :edit, :update]
  resources :activities_index_path
  resources :activities, only: [:show, :new, :create, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
