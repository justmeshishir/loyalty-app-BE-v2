class Api::V1::BusinessessController < ApplicationController
  before_action :set_business, only: %i[show update destroy]

  def index
    render json: { data: Business.all.as_json }, status: :ok
  end

  def show
    render json: { data: @business.as_json }, status: :ok
  end

  def create
    business = Business.new(business_params)
    render json: { data: business.as_json }, status: :ok if business.save
  end

  def update
    render json: { data: @business.as_json }, status: :ok if @business.update(business_params)
  end

  def destroy
    render json: { message: "Deleted" }, status: :ok if @business.destroy
  end

  private

  def business_params
    params.require(:business).permit(:name, :first_name, :last_name, :email, :phone, :industry, :logo_url, :active)
  end

  def set_business
    @business = Business.find(params[:id])
  end
end
