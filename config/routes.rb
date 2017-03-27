Rails.application.routes.draw do

  devise_for :users
  root 'prototypes#index'

  resources :prototypes do
    resources :comments, only: %i(create destroy)
    resources :likes, only: %i(create destroy)
  end
  resources :users, only: %i(update edit show)
  resources :newests, only: :index
  resources :populars, only: :index
end
