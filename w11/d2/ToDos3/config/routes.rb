Rails.application.routes.draw do
  root to: 'static_pages#root'
 namespace :api do 
  resources :todos, except: [:edit, :new]
 end
end
