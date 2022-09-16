class Api::V1::SubscriptionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :validate_frequency

  def create
    customer = Customer.find(params[:customer_id])
    input = JSON.parse(request.body.read, symbolize_names: true)
    tea = Tea.find(input[:tea_id])
    
    new_sub = Subscription.new_subscription(input[:frequency], customer, tea)
    new_sub.save
    render json: Api::V1::SubscriptionSerializer.sub_data(new_sub), status: 201
  end
  
  def update
    customer = Customer.find(params[:customer_id])
    input = JSON.parse(request.body.read, symbolize_names: true)
    tea = Tea.find(input[:tea_id])

    cancelled_sub = Subscription.find(params[:id])
    cancelled_sub.status = 'cancelled'
    cancelled_sub.save
    render json: Api::V1::SubscriptionSerializer.sub_data(cancelled_sub), status: 202
  end

  private

  def record_not_found
    render json: { 'error': 'invalid input'}, status: 404
  end

  # def parse_json
  #   @input = JSON.parse(request.body.read, symbolize_names: true)
  # end

  def validate_frequency
    input = JSON.parse(request.body.read, symbolize_names: true)
    if !['weekly', 'monthly', 'yearly'].include?(input[:frequency])
      render json: { 'error': 'invalid frequency' }, status: 404
    end
  end
end