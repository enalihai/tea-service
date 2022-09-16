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
    end
  end

  context 'unsuccessfully unsubscribes the customer' do
    it 'returns 404'
  end
end