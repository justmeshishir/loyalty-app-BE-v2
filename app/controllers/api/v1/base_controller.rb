module Api
  module V1
    class BaseController < ApplicationController
      before_action :authenticate_business!

      def current_business
        super
      end
    end
  end
end
