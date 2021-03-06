Sigma::Application.routes.draw do
  #get "sessions/login"
  #get "sessions/home"
  #get "sessions/profile"
  #get "sessions/setting"
  # get "main/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'sessions#login'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :sigs do
    member do
	  post 'like'
	end
  end

  resources :edges do
    member do
	  post 'connect'
	end
  end

  resources :users

  resources :sessions do
    collection do
	  get 'login'
      get 'logout'
      get 'setting'
      get 'home'
      post 'login_attempt'
	end
  end

  #resources :sessions  
  #get 'sessions/login' => 'sessions#login'
  #post 'sessions/login_attempt' => 'sessions#login_attempt'
  #get 'sessions/logout' => 'sessions#logout'
  #get 'sessions/home' => 'sessions#home'
  #get 'sessions/setting' => 'sessions#setting'

  #root :to => "sessions#login"
  #match "login", :to => "sessions#login"
  #match "logout", :to => "sessions#logout"
  #match "home", :to => "sessions#home"
  #match "profile", :to => "sessions#profile"
  #match "setting", :to => "sessions#setting"

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
