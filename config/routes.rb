Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'home',        to: 'dashboard#home'
  get 'export',      to: 'dashboard#export'
  get 'billing/due', to: 'billing#due'

  resources :dashboard, only: [] do
    collection do
      post :export
    end
  end

  resources :categories
  resources :customers
  resources :orders do
    collection do
      get :outstanding
    end
    member do
      get :pick_list
      get :invoice
      get :invoice_preview

      post :mark_as_billed
    end

    resources :order_items, only: [:index, :new, :create], path: :items do
    end
  end

  resources :order_items, only: [:update, :edit, :show] do
    member do
      get :split
    end
  end

  resources :pre_orders do
    resources :pre_order_items, only: [:index, :new, :create, :update, :edit, :show], path: :items

    member do
      post :upload
      get :new_items
    end
  end

  resources :pre_order_codes
  resources :pre_order_items, only: [:destroy]

  resources :purchase_orders do
    collection do
    end

    member do
      post :upload
      get :new_items
      get :receive
    end

    resources :purchase_order_items, only: [:index, :new, :create, :update, :edit, :show], path: :items do
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
      get  :export
      get  :lookup
      put  :search
      post :search
    end
    resources :sku_cust_infos, shallow: true
  end
  resources :vendors

  scope 'receive' do
    get 'by_sku', to: 'receiving#receive'
    get 'by_po',  to: 'receiving#receive'
  end

  root to: 'dashboard#home'
end
