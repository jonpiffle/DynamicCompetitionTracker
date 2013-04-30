Eecs341::Application.routes.draw do
  root :to => 'leagues#index'


  resources :teams do
    get :autocomplete_player_name, :on => :collection
  end

  match "teams/:id/remove_player/:player_id" => 'teams#remove_player', :as => :remove_player


  resources :scores

  resources :plays_ins do
    get :autocomplete_player_name, :on => :collection
  end

  resources :players

  resources :competitions do
    resources :score_types, :on => :collection
  end

  resources :leagues do
    get :autocomplete_team_name, :on => :collection
    get :autocomplete_player_name, :on => :collection
    get :add_teams, :on => :member
    put :save_teams, :on => :member 
    get :starting_point, :on => :member
    resources :hangouts do
      get :starting_point, :on => :member
      get :autocomplete_player_name, :on => :collection
      resources :matches, :shallow => true do
        get :create_and_redirect, :on => :member
        resources :game_sets, :shallow => true do 
          resources :games
        end
      end
    end
  end

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
