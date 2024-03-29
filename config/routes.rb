Rails.application.routes.draw do

  resources :cities

  resources :tour_orders do
    member do
      post 'pay' 

      post 'cancel'
      post 'refund'

      get 'alipay_done'
      post 'alipay_notify'
    end
  end

  resources :hotels do
    resources :rooms
  end

  resources :tours do
    resources :tickets
  end

  get 'home/index'

  devise_for :users

  namespace :api do
    devise_scope :user do
      post 'sessions' => 'sessions#create', :as => 'login'
      delete 'sessions' => 'sessions#destroy', :as => 'logout'
      post 'registrations' => 'registrations#create', :as => 'register'
    end
  end

  namespace :admin do
    resources :tickets do
      collection do
        delete 'destroy_multiple'
      end
    end
    resources :tours do
      collection do
        delete 'destroy_multiple'
      end
      resources :tickets
    end
    resources :users do
      collection do
        delete 'destroy_multiple'
      end
    end
    resources :tour_orders
  end




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
