Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :businesses, path: "", path_names: {
    sign_in: "businesses/login",
    sign_out: "businesses/logout"
  }, controllers: {
    sessions: "businesses/sessions"
  }

  namespace :api do
    namespace :v1 do
      resources :businessess
      resources :customers

      # Loyalty settings endpoints
      scope :stamps do
        get "/", to: "loyalty_settings#list_stamp_settings"
        post "/", to: "loyalty_settings#create_stamp_setting"
        put "/:id", to: "loyalty_settings#update_stamp_setting"

        # Routes for customers for stamps
        post "/:business_customer_id/create", to: "business_customers#create_stamp"
        delete "/:business_customer_id/destroy/:id", to: "business_customers#destroy_stamp"
      end

      scope :discounts do
        get "/", to: "loyalty_settings#list_discount_settings"
        post "/", to: "loyalty_settings#create_discount_setting"
        put "/:id", to: "loyalty_settings#update_discount_setting"
      end

      scope :points do
        get "/", to: "loyalty_settings#list_point_settings"
        post "/", to: "loyalty_settings#create_point_setting"
        put "/:id", to: "loyalty_settings#update_point_setting"

        # Routes for customers for points
        post "/:business_customer_id/create", to: "business_customers#create_points"
        delete "/:business_customer_id/destroy/:id", to: "business_customers#destroy_points"
      end

      delete "/loyalty_settings/:id", to: "loyalty_settings#destroy"

      resources :visits, only: [ :create ]
    end
  end
end
