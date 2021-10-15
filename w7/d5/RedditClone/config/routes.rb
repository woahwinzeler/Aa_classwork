Rails.application.routes.draw do
  resource :session, only: [:new, :destroy, :create]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
