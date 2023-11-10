Rails.application.routes.draw do
  devise_for :users
  root to: 'protospaces#index'
  resources :protospaces, as: 'prototypes'
end
