Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  concern :auditable do
    member { get :audit }
  end

  concern :receivable do
    member { get :receive }
  end

  concern :has_items do
    member do
      post :upload
      get :new_items
    end
  end

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

      get 'ship_list(/:preview)', to: 'orders#ship_list', as: :ship_list
      get :ship_list_preview

      get :confirmation
      get :confirmation_preview

      get :shipping_label
      get :shipping_label_preview

      post :mark_as_billed
    end

    resources :order_items, only: [:index, :new, :create], path: :items do
    end
  end

  resources :order_items, only: [:update, :edit, :show, :destroy] do
    member do
      get   :split
      patch :split
      post :mark_as_delivered
      post :confirm_picked
    end
  end

  resources :order_deposits do
  end

  resources :order_payments do
    resources :order_payment_items, except: [:destroy], path: :items
  end

  resources :order_payment_items do
  end

  resources :pre_orders, concerns: [:has_items, :auditable] do
    resources :pre_order_items, except: [:destroy], path: :items

    member do
      post :create_order
      post :resend_confirmation
    end

  end

  resources :pre_order_codes
  resources :pre_order_items, only: [:destroy], concerns: [:auditable] do
    collection do
      get :outstanding
    end
  end

  resources :purchase_orders, concerns: [:has_items, :auditable, :receivable] do
    resources :purchase_order_items, except: [:destroy], path: :items
  end

  resources :purchase_order_items, only: [:index, :destroy, :update, :edit, :show], concerns: [:receivable] do
    member do
      get :label
      get :label_preview
      post :print
    end
  end

  resources :suppliers
  resources :skus, concerns: [:auditable, :receivable] do
    collection do
      get  :export
      get  :lookup
      put  :search
      post :search
    end

    member do
      get :po_history
    end

    resources :sku_cust_infos, shallow: true
  end

  resources :sku_po_histories, only: [:index]

  resources :vendors

  scope 'receive' do
    get 'by_sku', to: 'receiving#receive'
    get 'by_po',  to: 'receiving#receive'
  end

  post 'scan', to: 'scans#post'
  resources :inventory_scan_operations, only: [:index, :show]

  root to: 'dashboard#home'
end
