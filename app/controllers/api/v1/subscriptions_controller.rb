class Api::V1::SubscriptionsController < ApplicationController
  before_action :parse_json, :validate_frequency

  def create
    customer = Customer.find(params[:customer_id])
    tea = Tea.find(@input[:tea_id])

    new_sub = Subscription.new_subscription(@input[:frequency], customer, tea)
    new_sub.save
    render json: Api::V1::SubscriptionSerializer.sub_json(new_sub), status: 201
  end
  
  private

  def parse_json
    @input = JSON.parse(request.body.read, symbolize_names: true)
  end

  def validate_frequency
    if !['weekly', 'monthly', 'yearly'].include?(@input[:frequency])
      render json: { 'error': 'invalid frequency' }, status: 404
    end
  end
end