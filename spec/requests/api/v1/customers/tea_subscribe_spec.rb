require 'rails_helper'

RSpec.describe 'Subscribing to a Tea' do
  context 'successfully' do
    it 'returns a JSON package with the Subscription information' do
      customer = FactoryBot.create(:customer)
      tea = FactoryBot.create(:tea)

      
      post "/api/v1/customers/#{customer.id}/subscriptions",
        headers: {'Content-Type': 'application/json'},
        params: JSON.generate({tea_id: tea.id, frequency: 'yearly' })

      expect(response).to be_successful
      expect(response).to have_http_status 201

      subscription_data = JSON.parse(response.body, symbolize_names: true)
      
      expect(subscription_data).to have_key :data
      expect(subscription_data[:data]).to be_a Hash
      
      expect(subscription_data[:data]).to have_key :id
      expect(subscription_data[:data][:id]).to be_a String
      
      expect(subscription_data[:data]).to have_key :type
      expect(subscription_data[:data][:type]).to eq 'subscription'

      expect(subscription_data[:data]).to have_key :attributes
      expect(subscription_data[:data][:attributes]).to be_a Hash 

      subscription_info = subscription_data[:data][:attributes]

      expect(subscription_info).to have_key :title
      expect(subscription_info).to have_key :price
      expect(subscription_info).to have_key :frequency
      expect(subscription_info).to have_key :status
      expect(subscription_info[:title]).to be_a String
      expect(subscription_info[:price]).to eq 12000
      expect(subscription_info[:frequency]).to eq 'yearly'
      expect(subscription_info[:status]).to eq 'active'

      post "/api/v1/customers/#{customer.id}/subscriptions",
        headers: {'Content-Type': 'application/json'},
        params: JSON.generate({tea_id: tea.id, frequency: 'monthly' })

      expect(response).to be_successful
      expect(response).to have_http_status 201

      subscription_data = JSON.parse(response.body, symbolize_names: true)
      
      expect(subscription_data).to have_key :data
      expect(subscription_data[:data]).to be_a Hash
      
      expect(subscription_data[:data]).to have_key :id
      expect(subscription_data[:data][:id]).to be_a String
      
      expect(subscription_data[:data]).to have_key :type
      expect(subscription_data[:data][:type]).to eq 'subscription'

      expect(subscription_data[:data]).to have_key :attributes
      expect(subscription_data[:data][:attributes]).to be_a Hash 

      subscription_info = subscription_data[:data][:attributes]

      expect(subscription_info).to have_key :title
      expect(subscription_info).to have_key :price
      expect(subscription_info).to have_key :frequency
      expect(subscription_info).to have_key :status
      expect(subscription_info[:title]).to be_a String
      expect(subscription_info[:price]).to eq 1100
      expect(subscription_info[:frequency]).to eq 'monthly'
      expect(subscription_info[:status]).to eq 'active'

      post "/api/v1/customers/#{customer.id}/subscriptions",
        headers: {'Content-Type': 'application/json'},
        params: JSON.generate({tea_id: tea.id, frequency: 'weekly' })

      expect(response).to be_successful
      expect(response).to have_http_status 201

      subscription_data = JSON.parse(response.body, symbolize_names: true)
      
      expect(subscription_data).to have_key :data
      expect(subscription_data[:data]).to be_a Hash
      
      expect(subscription_data[:data]).to have_key :id
      expect(subscription_data[:data][:id]).to be_a String
      
      expect(subscription_data[:data]).to have_key :type
      expect(subscription_data[:data][:type]).to eq 'subscription'

      expect(subscription_data[:data]).to have_key :attributes
      expect(subscription_data[:data][:attributes]).to be_a Hash 

      subscription_info = subscription_data[:data][:attributes]

      expect(subscription_info).to have_key :title
      expect(subscription_info).to have_key :price
      expect(subscription_info).to have_key :frequency
      expect(subscription_info).to have_key :status
      expect(subscription_info[:title]).to be_a String
      expect(subscription_info[:price]).to eq 400
      expect(subscription_info[:frequency]).to eq 'weekly'
      expect(subscription_info[:status]).to eq 'active'
    end 
  end

  context 'unsuccessfully' do
    it 'returns 404 for bad frequency' do 
      customer = FactoryBot.create(:customer)
      tea = FactoryBot.create(:tea)

      post "/api/v1/customers/#{customer.id}/subscriptions",
        headers: {'Content-Type': 'application/json'},
        params: JSON.generate({tea_id: tea.id, frequency: 'daily' })

      expect(response).to_not be_successful
      expect(response).to have_http_status 404

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to have_key :error
      expect(error_response[:error]).to eq 'invalid frequency'
    end
  end
end