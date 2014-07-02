Rails.application.routes.draw do

  resources :healthchecks, only: [:index]

  [:capital, :transaction].each do |model|
    resources "#{model}s".to_sym, except: [:create, :update]
    post "#{model}s/new", to: "#{model}s#create", as: "create_#{model}".to_sym
    put "#{model}s/:id/edit", to: "#{model}s#update"
    patch "#{model}s/:id/edit", to: "#{model}s#update", as: "update_#{model}".to_sym
  end

  root 'capitals#index'

end
