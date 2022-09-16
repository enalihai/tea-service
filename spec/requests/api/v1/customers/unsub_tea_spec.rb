require 'rails_helper'

RSpec.describe "Usubscribing from a Tea Subscription" do
  context 'successfully unsubscribes the customer' do
    it 'returns a JSON package to the request' do
      customer = FactoryBot.create(:customer)
      tea = FactoryBot.create(:tea)
      customer.subscriptions.create!(
        tea_id: tea.id,
        frequency: 'yearly',
        price: 12000,
        title: "#{tea.title} = yearly sub for #{customer.first_name}",
        status: 'active'
      )

      sub_to_cancel = Subscription.all.last
      
      patch "/api/v1/customers/#{customer.id}/subscriptions/#{sub_to_cancel.id}"

      expect(response).to be_successful
      expect(response).to have_http_status 202

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response).to have_key :data
      expect(json_response[:data]).to be_a Hash
      expect(json_response[:data]).to have_key :id
      expect(json_response[:data][:id]).to be_a String
      expect(json_response[:data]).to have_key :type
      expect(json_response[:data][:type]).to eq 'subscription'
      expect(json_response[:data]).to have_key :attributes
      expect(json_response[:data][:attributes]).to be_a Hash

      attributes = json_response[:data][:attributes]

      expect(attributes).to have_key :title
      expect(attributes[:title]).to be_a String
      expect(attributes).to have_key :price
      expect(attributes[:price]).to be_a Integer
      expect(attributes).to have_key :frequency
      expect(attributes[:frequency]).to eq 'yearly'
      expect(attributes).to have_key :status
      expect(attributes[:status]).to eq 'cancelled'
    end
  end

  context 'unsuccessfully unsubscribes the customer' do
    it 'returns 404'
  end
end