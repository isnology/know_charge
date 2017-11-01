Rails.application.routes.draw do
  
  root 'profiles#show'
  devise_for :users
  
  # hide profile id, Note user set to dependent: :destroy so no destroy route
  get 'profiles/new' => 'profiles#new', as: 'new_profile'
  get 'profiles/edit' => 'profiles#edit', as: 'edit_profile'
  get 'profiles' => 'profiles#show', as: 'profiles'
  # edit action wants a profile_path (not profiles_path)
  get 'profiles' => 'profiles#show', as: 'profile'
  patch 'profiles' => 'profiles#update', as: ''
  put 'profiles' => 'profiles#update', as: ''
  post 'profiles' => 'profiles#create', as: 'new_profile_create'
  
  resources :vehicles
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
