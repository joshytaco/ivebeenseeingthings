Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :photos, only: [ :index, :create, :show ]

      # Authentication routes
      post "auth/login", to: "auth#login"
      post "auth/signup", to: "auth#signup"
      get "auth/google", to: "auth#google"
      get "auth/google/callback", to: "auth#google_callback"
      get "auth/apple", to: "auth#apple"
      get "auth/apple/callback", to: "auth#apple_callback"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Serve the React app for all other routes
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
  root "fallback#index"
end
