Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'home',   to: 'dashboard#home'

  resources :categories
  resources :customers
  resources :orders
  resources :pre_orders
  resources :purchase_orders do
  end
  resources :suppliers
  resources :skus
  resources :vendors

  root to: 'dashboard#home'
end
