Rails.application.routes.draw do
  # get 'bands/index'
  # get 'bands/create'
  # get 'bands/new'
  # get 'bands/edit'
  # get 'bands/show'
  # get 'bands/update'
  # get 'bands/destroy'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :show, :index, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :bands
end
