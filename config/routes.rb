Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'home',   to: 'dashboard#home'

  resources :categories
  resources :customers
  resources :orders
  resources :pre_orders

  resources :purchase_order_items do
    member do
      get :receive
    end
  end

  resources :purchase_orders do
    member do
      get :receive
    end
  end
  resources :purchase_order_items, only: [:update] do
    member do
      get :receive
    end
end

  resources :suppliers
  resources :skus do
    member do
      get :receive
    end

    collection do
      get  :lookup
      put  :search
      post :search
    end
  end
  resources :vendors

  scope 'receive' do
    get 'by_sku', to: 'receiving#receive'
    get 'by_po',  to: 'receiving#receive'
  end

  root to: 'dashboard#home'
end
