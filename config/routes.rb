Rails.application.routes.draw do
  devise_for :admins
  devise_for :authors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "readers/home#index"
  get "/blog/:id", to: "readers/posts#show", as: :blog_post
  get "blog", to: "readers/posts#index"
  
  scope module: 'readers' do
    resources :photos, only: %i[index]
  end
  
  # scope modele: 'readers' do
  # end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Defines the root path route ("/")
  # root "posts#index"
  scope module: 'authors' do
    resources :posts do 
      resources :post_elements do
        patch :move, on: :member
      end
      member do 
        get :publish
        get :unpublish
      end
    end
  end
end
