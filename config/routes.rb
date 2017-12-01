Rails.application.routes.draw do
  get 'profiles/show'
  root 'boats#index'
  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile


  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :boats
  resources :jobs
  resources :users



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
