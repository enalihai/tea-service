require 'rails_helper'

RSpec.describe Tea do
  context 'relationships' do
    it { should have_many :subscriptions }
    it { should have_many(:customers).through(:subscriptions)}
  end

  context 'validations' do
    it { should_validate_presence_of :title }
    it { should_validate_presence_of :description }
    it { should_validate_presence_of :temperature }
    it { should_validate_presence_of :brew_time }
  end
end 