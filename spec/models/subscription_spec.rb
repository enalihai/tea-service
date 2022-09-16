require 'rails_helper'

RSpec.describe Subscription do 
  context 'relationships' do
    it { should belong_to :customer }
    it { should belong_to :tea }
  end

  context 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_presence_of :status }
    it { should define_enum_for(:status).with_values([:active, :cancelled]) }
    it { should validate_presence_of :frequency }
    it { should define_enum_for(:frequency).with_values([:weekly, :monthly, :yearly])}
  end

  context 'class methods' do
    it ".new_subscription sets up a new sub" do
      customer = FactoryBot.create :customer
      tea = FactoryBot.create :tea

      subscription = Subscription.new_subscription('yearly', customer, tea)
      subscription.save
      
      expect(subscription).to be_a Subscription
      expect(subscription.title).to be_a String
      expect(subscription.price).to be_a Integer
      expect(subscription.frequency).to eq 'yearly'
      expect(subscription.status).to eq 'active'
    end 

    context ".get_frequency_price returns price for frequency" do
      it 'gets weekly' do
        price = Subscription.get_frequency_price('weekly')
        expect(price).to eq 400
      end 
      
      it 'gets monthly' do
        price = Subscription.get_frequency_price('monthly')
        expect(price).to eq 1100
      end

      it 'gets yearly' do
        price = Subscription.get_frequency_price('yearly')
        expect(price).to eq 12000
      end
    end
  end 
end 