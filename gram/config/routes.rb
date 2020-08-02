Rails.application.routes.draw do
  root 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  
  resources :users, only: [:new, :create]
end
