Rails.application.routes.draw do 
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  
  get 'items/' => 'items#index'
  
  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :create, :destroy]
      resources :shopping_lists, only: [:index, :create, :update, :destroy]
    end
  end
end
