Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  resources :sessions, only: [:new, :create, :destroy]

  get "login" => 'sessions#new'
  delete "logout" => 'sessions#destroy'

  resources :users

  resources :profiles

  resources :locations

  resources :searchs, only: [:index, :new]
end
