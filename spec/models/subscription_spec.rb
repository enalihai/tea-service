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
end 