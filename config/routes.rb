Rails.application.routes.draw do
  devise_for :users
  root to: 'protospaces#index'
  resources :protospaces, as: 'prototypes' do
    resources :comments, only: :create
  end


  resources :users, only: [:show]
end
