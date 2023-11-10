Rails.application.routes.draw do
  devise_for :users
  root to: 'protospaces#index'
  resources :protospaces, as: 'prototypes'
  resources :users, only: [:show]
end
