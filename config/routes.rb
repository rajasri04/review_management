Rails.application.routes.draw do
  root 'welcome#index'
  resources :abstracts do
    member do
      post 'accept'
      post 'reject'
    end
  end
  resources :students
  resources :staffs
  resources :messages
  resources :groups
  resources :sessions, only: [:new, :create, :destroy]
  get '/signup/staffs', to: 'staffs#signup'
  post '/signup/staffs', to: 'staffs#reset'
  get '/signup/students', to: 'students#signup'
  post '/signup/students', to: 'students#reset'
  get '/signin', to:'sessions#new'
  get '/signout', to: 'sessions#destroy'
  post '/relation', to:  'relation#create'
  resources :relation
  resources :panels_staffs
  resources :staffs do
    member do
      get 'displaystudent'
    end
  end

  resources :staffs do
    resources :progresses
    resources :panel
    resources :messages do
      member do
        post 'accept'
      end
    end
    resources :abstracts
    member do
      get 'notify'
      post 'confirm'
    end
  end
  resources :staffs do
     resources :students do
       resources :progresses
     end
  end
  resources :students do
    resources :projects
    resources :messages
    resources :groups
  end
   resources :students do
     member do
       get 'marksdisplay'
       get 'notify'
     end
   end
   resources :projects
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
