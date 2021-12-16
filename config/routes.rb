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

  resources :purchase_orders do
    collection do
    end

    member do
      post :upload
      get :new_items
      get :receive
    end

    resources :purchase_order_items, only: [:index, :new, :create], path: :items do
      member do
        get :receive
      end
    end
  end

  resources :purchase_order_items, only: [:update, :edit, :show] do
    member do
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
