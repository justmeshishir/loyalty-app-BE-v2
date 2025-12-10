module Api
  module V1
    class CustomersController < BaseController
      before_action :set_customer, only: %i[show update destroy]

      def index
        render json: { data: current_business.customers.as_json }, status: :ok
      end

      def show
        render json: { data: @customer.as_json }, status: :ok
      end

      def create
        customer = current_business.customers.create(customer_params)
        render json: { data: customer.as_json }, status: :ok if customer
      end

      def update
        render json: { data: @customer.as_json }, status: :ok if @customer.update(customer_params)
      end

      def destroy
        render json: { message: "Deleted" }, status: :ok if @customer.destroy
      end

      private

      def customer_params
        params.require(:customer).permit(:business_id, :first_name, :last_name, :email, :phone, :dob, :address, :gender, :active, :notes)
      end

      def set_customer
        @customer = current_business.customers.find(params[:id])
      end
    end
  end
end

