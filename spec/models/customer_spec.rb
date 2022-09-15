require 'rails_helper'

RSpec.describe Customer do
  context 'relationships' do
    it { should have_many :subsciptions }
    it { should have_many(:teas).through(:subscriptions) }
  end

  context 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :address }
  end
end