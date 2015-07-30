Rails.application.routes.draw do

  resources :merchants
  devise_for :admins

  get 'dashboard/index'

  resources :splashscreens
  resources :logos do
    get 'toggle_approve', :on => :member
  end
  get 'index' => 'image_mapping#index'

  require 'api_constraints'


  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :banners
      resources :magazines
      resources :pages
      resources :coordinates
      resources :logos
      resources :splashscreens
      get 'ios_pages' => 'pages#ios_pages'
      get 'test' => 'pages#test'
      get 'banners_full_data' => 'banners#banners_full_data'
      get 'notify' => 'banners#notify'
      get 'magazine_updated_at' => 'magazines#magazine_updated_at'



    end
  end


  resources :banners do
    post :update_row_order, on: :collection
    get 'toggle_approve', :on => :member
  end

  resources :coordinates
  resources :pages do
    get 'clone', :as => 'clone'
    get 'toggle_approve', :on => :member
  end


  resources :magazines do
    post :update_row_order, on: :collection
    get 'toggle_approve', :on => :member

  end
  get 'admin/index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  get 'inactive_magazine' => 'magazines#inactive_magazine'
  get 'active_magazine' => 'magazines#active_magazine'
  get 'all_magazine' => 'magazines#all_magazine'

  get 'inactive_pages' => 'pages#inactive_pages'
  get 'active_pages' => 'pages#active_pages'
  get 'all_pages' => 'pages#all_pages'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'clone' => 'pages#clone'
  get 'movepage' => 'pages#movepage'
  get 'merchant_banners' => 'merchants#merchant_banners'
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
  #     # (app/controllers/admin/banners_controller.rb)
  #     resources :products
  #   end
end
