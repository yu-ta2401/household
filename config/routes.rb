Rails.application.routes.draw do
  devise_for :admins, controllers: {
     sessions: 'admins/sessions'
  }
  devise_for :users
  root to: 'items#index'
  resources :articles
  resources :users, only: [:edit, :update]
  resources :items
end
