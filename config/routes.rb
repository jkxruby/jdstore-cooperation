Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  namespace :admin do
    resources :products
    resources :categories
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

  namespace :account do
    resources :orders
  end

  resources :products do
    member do
      post :add_to_cart
      post :join
      post :quit
    end

    collection do
      get :search
    end
    resources :reviews
  end

  resources :cart_items

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

   root 'welcome#index'
end
