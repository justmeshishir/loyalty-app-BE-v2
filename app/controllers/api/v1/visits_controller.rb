module Api
  module V1
    class VisitsController < BaseController
      before_action :set_business_customer

      def create
        visit = @business_customer.visits.new(visit_params)
        if visit.save
          render json: { data: visit.as_json }, status: :ok
        else
          render json: { message: visit.errors.full_messages }, status: :bad_request
        end
      end

      private

      def set_business_customer
        @business_customer = BusinessCustomer.find(params[:business_customer_id])
      end

      def visit_params
        params.require(:visit).permit(:note, :amount_spent)
      end
    end
  end
end
