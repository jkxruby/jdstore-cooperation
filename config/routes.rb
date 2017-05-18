Rails.application.routes.draw do
  devise_for :users
  resources :carts do
    collection do
      delete :clean
    end
  end

  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :cart_items

   root 'products#index'
end
