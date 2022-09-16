require 'rails_helper'

RSpec.describe 'Subscribing to a Tea' do
  context 'successfully' do
    it 'returns a JSON package with the Subscription information' do
      customer = FactoryBot.create(:customer)
      tea = FactoryBot.create(:tea)

      headers = {'CONTENT_TYPE' => 'application/json'}
      params = JSON.generate({tea_id: tea.id, frequency: 'yearly' })

      post "/api/v1/customers/#{customer.id}/subscriptions"
      
      expect(response).to be_successful
      expect(response).to have_status 201

      subscription_data = JSON.parse(response.body, symbolize_names: true)
      
      expect(subscription_data).to have_key :data
      expect(subscription_data[:data]).to be_a Hash
      
      expect(subscription_data[:data]).to have_key :id
      expect(subscription_data[:data][:id]).to be_a String
      
      expect(subscription_data[:data]).to have_key :type
      expect(subscription_data[:data][:type].to eq 'subscription'

      expect(subscription_data[:data]).to have_key :attributes
      expect(subscription_data[:data][:attributes]).to be_a Hash 

      subscription_info = subscription_data[:data][:attributes]

      expect(subscription_info).to have_keys :title, :price, :frequency, :status
      expect(subscription_info[:title]).to be_a String
      expect(subscription_info[:price]).to be_a Integer
      expect(subscription_info[:frequency]).to eq 'yearly'
      expect(subscription_info[:status]).to eq 'active'
    end 
  end

  context 'unsuccessfully' do
    it 'returns 404'

end