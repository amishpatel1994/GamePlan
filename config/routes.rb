Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#show"
  get "login", to: redirect("/auth/google_oauth2"), as: "login"
  get "logout", to: "session#destroy", as: "logout"
  get "/auth/:provider/callback", to: "session#create"
  get "auth/failure", to: redirect("/")

  resources :exercises, only: %w(index show create update)
  resources :workouts
  resources :exercise_logs, only: %w(show create update destroy)
end
