Rails.application.routes.draw do
  get 'users/update'

  get 'users/edit'

  get 'users/show'

  devise_for :users
	root 'pages#home'
	resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
