SystemServer::Application.routes.draw do

  resources :people
  resources :places
  resources :capabilities
  resources :reservations
  resources :capabilities_places
  root :to => 'login#login'
  match '/login_request' => 'login#login_action'
  match '/check_place_empty' => 'show_queries#check_place_empty'
  match '/check_place_empty_request' => 'show_queries#check_place_empty_action'
  match '/check_place_status' => 'show_queries#check_place_status'
  match '/check_place_status_request' => 'show_queries#check_place_status_action'
  match '/search_specific_place' => 'show_queries#search_specific_place'  
  match '/search_specific_place_request' => 'show_queries#search_specific_place_action'
  match '/reservations_page' => 'reservations#index'
  match '/capabilities_page' => 'capabilities#index'
  match '/places_page' => 'places#index'
  match '/capabilities_places_page' => 'capabilities_places#index'
  match '/signup_request' => 'people#new'
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
