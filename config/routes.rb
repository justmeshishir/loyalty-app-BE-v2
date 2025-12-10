Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :businesses, path: "", path_names: {
    sign_in: "businesses/login",
    sign_out: "businesses/logout",
    registration: "businesses/signup"
  }, controllers: {
    sessions: "businesses/sessions",
    registrations: "businesses/registrations"
  }

  namespace :api do
    namespace :v1 do
      resources :businessess
      resources :customers
    end
  end
end
