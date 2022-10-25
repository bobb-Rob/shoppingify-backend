Rails.application.routes.draw do 
  devise_for :users, only: [:sessions, :registrations],
  controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
    
  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :create, :destroy]
      resources :shopping_lists, only: [:index, :create, :update]
    end
  end
end
