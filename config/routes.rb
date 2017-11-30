Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' } 
  resources :boats
  resources :jobs

root 'boats#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
