Rails.application.routes.draw do
  root to: 'protospaces#index'
  resources :protospaces, only: [:new]
end
