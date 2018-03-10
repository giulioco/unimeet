Rails.application.routes.draw do
  
  mount ActionCable.server => '/cable'
  resources :chatrooms, param: :id
  resources :messages
  notify_to :users, with_devise: :users, controller: 'users/notifications'
  
  get 'activities/new' => 'activities#new'
  get 'activities/show.:id' => 'activities#show'
  post 'activities/new' => 'activities#create'
  post 'activities/edit' => 'activities#edit'
  post 'activities/update' => 'activities#update'
  post 'activities/like_activity'
  post 'activities/dislike_activity' 
  get 'activities/destroy' => 'activities#destroy'
  delete 'activities/destroy' => 'activities#destroy'
  get 'chatrooms/show/:id' => 'chatrooms#show'
  #get 'activities/edit'
  #problem: when i go to activities/new it now thinks that new is the id
  #get 'new_activity' => 'activities/new' 
  
  post 'pages/like_activity' => 'activities/like_activity'
  post 'pages/dislike_activity' => 'activities/dislike_activity'
  post 'pages/unmatch_activity' => 'pages/unmatch_activity'
  post 'pages/leave_activity' => 'pages/leave_activity'
  post 'pages/join_activity' => 'pages/join_activity'
  post 'pages/unmatch_profile' => 'pages/unmatch_profile'
  post 'pages/dislike_activity' => 'activities/dislike_activity'
  post 'pages/like_profile' => 'users/like_profile'
  post 'pages/dislike_profile' => 'users/dislike_profile'
  get  'pages/home_activity_perspective' => 'pages#home_activity_perspective'
  get  'pages/home' => 'pages#home'
  get 'users/show'
  get 'pages/show_card' => 'pages#show_card'
  get 'pages/show_edit_activity_card' => 'pages#show_edit_activity_card'
  get 'pages/show_edit_profile_card' => 'pages#show_edit_profile_card'
  get 'pages/show_new_activity_card' => 'pages#show_new_activity_card'
  get 'pages/like_activity' => 'pages/show_card'
  get 'pages/dislike_activity' => 'pages/show_card'
  get 'pages/show_profile_card' => 'pages#show_profile_card'
  get 'pages/like_profile' => 'pages/show_profile_card'
  get 'pages/dislike_profile' => 'pages/show_profile_card'
  get 'pages/unmatch_activity' => 'pages/unmatch_activity'
  get 'pages/join_activity' => 'pages/join_activity'
  get 'pages/unmatch_profile' => 'pages/unmatch_profile'
  get 'pages/leave_activity' => 'pages/leave_activity'
  get 'pages/show_chat' => 'pages/show_chat'
  get 'pages/back_to_swipe' => 'pages/back_to_swipe'

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
