Rails.application.routes.draw do

  resources :healthchecks, only: [:index]
  resources :transactions
  resources :capitals

  root 'capitals#index'

end
