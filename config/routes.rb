Rails.application.routes.draw do
  resources :images
  # Custom Routes
  get 'photos', to: 'pages#photos'
  get 'about-us', to: 'pages#about_us'
  resources :pages, only: %i[ index ]
  resources :photos
  resources :admin, only: %i[ index ] do
    collection do
      get :posts
      get :users
    end
  end

  resources :posts do 
    member do
      post :toggle_publish  
    end
    resources :elements do
      patch :move, on: :member
    end
    resources :comments
  end

  resources :users, only: %i[ edit update destroy ]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Defines the root path route ("/")
  root "pages#index"
end
