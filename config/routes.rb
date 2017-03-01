Rails.application.routes.draw do

  root 'prototypes#index'

  resources :prototypes do
    resources :comments
  end
end
