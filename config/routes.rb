Rails.application.routes.draw do
  resources :accounts

  resources :driverprofiles
 root 'home#index'
  devise_for :drivers
devise_for :users

  resources :booking_addons

  resources :bookings

  resources :userprofiles

  get 'sampleData1' =>'bookings#sampleData1', :as=>'sampleData1'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  

  

     devise_scope :user do
   authenticated :user do
    
    root 'home#index', as: :authenticated_root
  end
  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
devise_for :admins

 devise_scope :admin do
 
  authenticated :admin do
    root 'home#index', as: :admin_authenticated_root
  end

  unauthenticated :admin do
    root 'devise/sessions#new', as: :unauthenticate_admin  
  end
end

 namespace "admin" do
  
  root 'users#index'
     resources :users do
       collection do
        delete 'destroy_multiple'
       end
      end

    resources :vendors do

      collection do
        delete 'destroy_multiple'
       end
      
    resources :vehicles
    resources :drivers
  end
   resources :accounts
   resources :vehicles
   resources :drivers
   resources :vehicles
   resources :drivers
   resources :addons do
       collection do
        delete 'destroy_multiple'
       end
      end
     resources :bookings do
      
       collection do
        delete 'destroy_multiple'
        get :autocomplete_vendor_name

       end
      end
     get "drivers/select_drivers/:id" => "drivers#select_drivers"
     get "vehicles/select_vehicles/:id" => "vehicles#select_vehicles"
     #get '/users/export_to_csv' => 'users#export_to_csv'

     #get 'update_drivers_select/:id', :controller=>'drivers', :action => 'update_drivers_select'
#match 'update_driver_select/:id', to: 'drivers#new', via: [:get, :post]
  #match 'profiles/update_city_select/:id', :controller=>'profiles', :action => 'update_city_select'
     
end
#root 'home#index'

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

  namespace :api do
    namespace :v1 do
     devise_scope :user do
       post 'signup' => 'registrations#create', :as => 'register'
       post 'signin' => 'sessions#create', :as => 'signin'
       delete 'signout' => 'sessions#destroy', :as => 'signout'
       post 'personalinfo' => 'users#edit' , :as => 'personalinfo'
       get 'personalinfodetail' => 'users#details' , :as => 'personalinfodetail'
       post 'medicalinfo' => 'users#medicalinfo' , :as => 'medicalinfo'
       get 'medicalinfodetail' => 'users#medicalinfodetails' , :as => 'medicalinfodetail'
       post 'changepassword' => 'users#changepassword', :as => 'changepassword'

       #match 'registrations', to: 'registrations#create', via: [:options]
      end


      #get "userprofile/id/personalinfo/" => "userprofile#personalinfo"
      resources :bookings
      
      post 'bookingupdate/:id' =>'bookings#update',:as=>'bookingupdate'
      post 'bookingdelete/:id' =>'bookings#destroy' , :as=>'bookingdelete'
      get 'bookingmonthyear' =>'bookings#monthyear' , :as=>'bookingmonthyear'
      post 'bookingcancel/:id' =>'bookings#cancel',:as=>'bookingcancel'
      post 'bookingfeedback/:id' =>'bookings#feedback',:as=>'bookingfeedback'
      post 'vehiclestatus/:id' =>'bookings#vehiclestatus',:as=>'vehiclestatus'

      
      #resources :vendors do
        get 'match' =>'vendors#index',:as=>'match'

        get 'vendordetail/:id' =>'vendors#show',:as=>'vendordetail'
      #end

      #devise_for :admins 

      #devise_scope :admin do
 
       #authenticated :admin do
       #root 'home#index', as: :admin_authenticated_root
       #end

       #unauthenticated do
       #root 'home#index', as: :admin_unauthenticated_root  
       #end
      #end
       #namespace "admin" do
       #root 'home#index'
       #resources :users
       #resources :addons
       #resources :vendors do
       #resources :vehicles
       #resources :drivers
       # end
       #resources :bookings
       #get "drivers/select_drivers/:id" => "drivers#select_drivers"
       #get "vehicles/select_vehicles/:id" => "vehicles#select_vehicles"
       #get 'update_drivers_select/:id', :controller=>'drivers', :action => 'update_drivers_select'
       #match 'update_driver_select/:id', to: 'drivers#new', via: [:get, :post]
       #match 'profiles/update_city_select/:id', :controller=>'profiles', :action => 'update_city_select'
    
       #end

    end
  end 
  #devise_for(:drivers, :controllers => { :sessions => "driver/v1/sessions"})
        namespace :driver do
        namespace :v1 do
          devise_scope :driver do
           # post 'registrations' => 'registrations#create', :as => 'register'
             post 'signin' => 'sessions#create', :as => 'signin'
             delete 'signout' => 'sessions#destroy', :as => 'signout'
          end
          get 'joblist' =>'bookings#index',:as=>'joblist'
          get 'joblistdetails/:id' =>'bookings#show',:as=>'joblistdetails'
         
        end
      end

end
