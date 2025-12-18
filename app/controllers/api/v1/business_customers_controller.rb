module Api
  module V1
    class BusinessCustomersController < BaseController
      before_action :set_business_customer

      def create_stamp
        stamp = @business_customer.stamps.new(stamp_params)
        if stamp.save
          render json: { data: stamp.as_json }, status: :ok
        else
          render json: { message: stamp.errors.full_messages }, status: :bad_request
        end
      end

      def destroy_stamp
        stamp = @business_customer.stamps.find(params[:id])
        if stamp.destroy
          render json: { message: "Deleted" }, status: :ok
        else
          render json: { message: stamp.errors.full_messages }, status: :bad_request
        end
      end

      private

      def set_business_customer
        @business_customer = current_business.business_customers.find(params[:business_customer_id])
      end

      def stamp_params
        params.require(:stamp).permit(:stamp_setting_id)
      end
    end
  end
end
