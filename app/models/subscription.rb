class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer

  validates_presence_of :title, :price, :status, :frequency
  validates_numericality_of :price

  enum status: [:active, :cancelled]
  enum frequency: [:weekly, :monthly, :yearly]

  def self.new_subscription(frequency, customer, tea)
    new_subscription_hash = {
      customer_id: customer.id,
      tea_id: tea.id,
      frequency: frequency,
      title: "#{tea.title} = #{frequency} subscription for #{customer.first_name}",
      status: 'active'
    }

    case frequency
      when 'weekly'
        new_subscription_hash[:price] = 400
      when 'monthly'
        new_subscription_hash[:price] = 1100
      when 'yearly'
        new_subscription_hash[:price] = 12000
    else; end

    new(new_subscription_hash)
  end
end
