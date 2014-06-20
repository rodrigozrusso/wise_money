Rails.application.routes.draw do

  resources :transactions

  resources :capitals

  root 'capitals#index'

end
