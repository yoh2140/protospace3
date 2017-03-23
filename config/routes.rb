Rails.application.routes.draw do

  devise_for :users
  root 'prototypes#index'

  resources :prototypes do
    resources :comments
    resources :likes, only: %i(create destroy)
  end
  resources :users, only: [:update, :edit, :show]
end
