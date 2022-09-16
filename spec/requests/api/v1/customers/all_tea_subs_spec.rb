require 'rails_helper'

RSpec.describe "Return all Customer Subs" do
  context 'successfully' do
    it 'displays a customers subs active and cancelled' do
      customer = FactoryBot.create :customer
      green_tea = FactoryBot.create :tea
      sweet_tea = FactoryBot.create :tea
      black_tea = FactoryBot.create :tea
      unsweet_tea = FactoryBot.create :tea
      teas = [green_tea.id, sweet_tea.id, black_tea.id, unsweet_tea.id]
      prices = [400, 1100, 12000]
      status = ['active', 'cancelled']
      frequency = ['weekly', 'monthly', 'yearly']

      15.times do |i|
        customer.subscriptions.create!(
          tea_id: teas.sample,
          title: "Subscription #{i}",
          frequency: frequency.sample,
          price: prices.sample,
          status: status.sample
        )
      end

      get "/api/v1/customers/#{customer.id}/subscriptions"

      expect(response).to be_successful
      expect(response).to have_http_status 200
    end
  end

  context 'unsuccessfully' do
    it 'returns 404'
  end
end