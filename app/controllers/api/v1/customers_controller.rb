class Api::V1::CustomersController < ApplicationController
  before_action :set_customer, only: %i[show update destroy]

  def index
    render json: { data: Customer.all.as_json }, status: :ok
  end

  def show
    render json: { data: @customer.as_json }, status: :ok
  end

  def create
    customer = Customer.new(customer_params)
    render json: { data: customer.as_json }, status: :ok if customer.save
  end

  def update
    render json: { data: @customer.as_json }, status: :ok if @customer.update(customer_params)
  end

  def destroy
    render json: { message: "Deleted" }, status: :ok if @customer.destroy
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone, :dob, :address, :gender, :active, :notes)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
