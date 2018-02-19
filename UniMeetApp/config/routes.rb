Rails.application.routes.draw do

  get 'activities/new' => 'activities#new'
  get 'activities/:id' => 'activities#show'
  #get 'activities/edit'

  #get 'activities/update'
  get 'activities/show'
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
