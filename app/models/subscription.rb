class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer

  validates_presence_of :title, :price, :status, :frequency
  validates_numericality_of :price

  enum status: [:active, :cancelled]
  enum frequency: [:weekly, :monthly, :yearly]
end
