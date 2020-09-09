Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :articles
  resources :users, only: [:edit, :update]
  resources :items
end
