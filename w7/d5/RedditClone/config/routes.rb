Rails.application.routes.draw do
  resource :session, only: [:new, :destroy, :create]
  resources :users
 
end
