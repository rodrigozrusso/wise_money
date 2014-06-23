Rails.application.routes.draw do

  resources :healthchecks, only: [:index]
  resources :transactions

  resources :capitals, except: [:create, :update]
  post 'capitals/new', to: 'capitals#create', as: :create_capital
  put 'capitals/:id/edit', to: 'capitals#update'
  patch 'capitals/:id/edit', to: 'capitals#update', as: :update_capital

  root 'capitals#index'

end
