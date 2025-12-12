module Api
  module V1
    class LoyaltySettingsController < BaseController
      # APIs for Stamp - Loyalty Setting
      def list_stamp_settings
        render json: { data: current_business.stamp_settings.order(created_at: :desc).as_json }, status: :ok
      end

      def create_stamp_setting
        stamp_setting = current_business.stamp_settings.new(loyalty_setting_params)
        render json: { data: stamp_setting.as_json }, status: :ok if stamp_setting.save
      end

      def update_stamp_setting
        stamp_setting = current_business.stamp_settings.find(params[:id])
        render json: { data: stamp_setting.as_json }, status: :ok if stamp_setting.update(loyalty_setting_params)
      end

      # APIs for Point - Loyalty Setting
      def list_point_settings
        render json: { data: current_business.point_settings.order(created_at: :desc).as_json }, status: :ok
      end

      def create_point_setting
        point_setting = current_business.point_settings.new(loyalty_setting_params)
        render json: { data: point_setting.as_json }, status: :ok if point_setting.save
      end

      def update_point_setting
        point_setting = current_business.point_settings.find(params[:id])
        render json: { data: point_setting.as_json }, status: :ok if point_setting.update(loyalty_setting_params)
      end

      # APIs for Discount - Loyalty Setting
      def list_discount_settings
        render json: { data: current_business.discount_settings.order(created_at: :desc).as_json }, status: :ok
      end

      def create_discount_setting
        discount_setting = current_business.discount_settings.new(loyalty_setting_params)
        render json: { data: discount_setting.as_json }, status: :ok if discount_setting.save
      end

      def update_discount_setting
        discount_setting = current_business.discount_settings.find(params[:id])
        render json: { data: discount_setting.as_json }, status: :ok if discount_setting.update(loyalty_setting_params)
      end

      # Destroy action for all types of Loyalty Setting
      # No need to differentiate this action by types
      def destroy
        loyalty_setting = current_business.loyalty_settings.find(params[:id])
        render json: { message: "Deleted" }, status: :ok if loyalty_setting.destroy
      end

      private

      def loyalty_setting_params
        params.require(:loyalty_setting).permit(:offer_name, :status, :valid_days, rules: {})
      end
    end
  end
end

