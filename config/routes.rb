Rails.application.routes.draw do
  root to: 'protospaces#index'
  resources :protospaces, only: [:index, :new, :create]
end
