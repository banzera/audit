Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'home',   to: 'dashboard#home'

  resources :categories
  resources :customers
  resources :orders do
    collection do
      get :outstanding
    end
    member do
      get :pick_list
    end
  end

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
  resources :purchase_order_items, only: [:index, :update] do
    member do
      get :receive
      get :label
      get :label_preview
      post :print
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
