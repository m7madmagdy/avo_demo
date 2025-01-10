class Order < ApplicationRecord
  has_many :order_promotions, dependent: :destroy
  has_many :promotions, through: :order_promotions

  def total_after_discounts
    self[:total_after_discounts] || total
  end
end
