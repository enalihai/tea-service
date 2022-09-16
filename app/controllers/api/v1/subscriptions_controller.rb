class Api::V1::SubscriptionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :no_nil, :parse_json, :validate_frequency
  
  def index
    customer = Customer.find(params[:customer_id])

    render json: Api::V1::SubscriptionSerializer.list_all(customer.subscriptions)
  end

  def create
    customer = Customer.find(params[:customer_id])
    tea = Tea.find(@input[:tea_id])

    new_sub = Subscription.new_subscription(@input[:frequency], customer, tea)
    new_sub.save
    render json: Api::V1::SubscriptionSerializer.sub_json(new_sub), status: 201
  end
  
  private

  def no_nil
    if request.body.read == ""
      return {'error': 'cant be nil'}, status: 422
    end
  end

  def record_not_found
    render json: { 'error': 'invalid input'}, status: 404
  end

  def parse_json
    @input = JSON.parse(request.body.read, symbolize_names: true)
  end

  def validate_frequency
    if !['weekly', 'monthly', 'yearly'].include?(@input[:frequency])
      render json: { 'error': 'invalid frequency' }, status: 404
    end
  end
end