Rails.application.routes.draw do

  resources :capitals

  root 'capitals#index'

end
