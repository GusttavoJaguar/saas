Rails.application.routes.draw do
  get "public/home"



  # Defines the root path route ("/")
  authenticated :user do
    root "dashboard#index", as: :authenticated_root
  end

  unauthenticated do
    root "public#home"
  end


  resources :stores do
    resources :events
    resources :photos
  end

  devise_for :users


  devise_scope :user do
    get "admin/login", to: "admin/sessions#new"
    post "admin/login", to: "admin/sessions#create"
    delete "admin/logout", to: "admin/sessions#destroy"
  end
  
  get "dashboard", to: "dashboard#index"
  

  namespace :admin do
    get "dashboard", to: "dashboard#index"
    resources :stores, only: [:index, :show, :edit, :destroy]
    resources :users, only: [:index, :show, :edit, :destroy]
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#home", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  
  # Página pública
   get "/public/store/:id", to: "public#store", as: :public_store
   get "/store/:id", to: "public#home"
end
