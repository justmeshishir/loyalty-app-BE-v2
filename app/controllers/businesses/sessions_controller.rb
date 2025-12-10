# frozen_string_literal: true

class Businesses::SessionsController < Devise::SessionsController
  private

  def respond_with(current_business, _opts = {})
    render json: {
      status: {
        code: 200, message: "Logged in successfully.",
        data: { business: current_business }
      }
    }, status: :ok
  end

  def respond_to_on_destroy
    return unless request.headers["Authorization"].present?

    jwt_payload = JWT.decode(request.headers["Authorization"].split(" ").last,
                             Rails.application.credentials.devise_jwt_secret_key!).first
    current_business = Business.find(jwt_payload["sub"])

    if current_business
      render json: {
        status: 200,
        message: "Logged out successfully."
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
