Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  root to: 'items#index'
  resources :articles
  resources :users, only: [:edit, :update]
  resources :items
end
