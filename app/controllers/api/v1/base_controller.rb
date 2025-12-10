module Api
  module V1
    class BaseController < ApplicationController
      before_action :authenticate_business!
    end
  end
end
