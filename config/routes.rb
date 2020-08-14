Rails.application.routes.draw do
  get 'users/new'

  root 'pages#index'
  get 'pages/index'
  
  resources :users
end
