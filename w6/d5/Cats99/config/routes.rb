Rails.application.routes.draw do
  resources :cats, only: [:index, :show, :new, :create]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
