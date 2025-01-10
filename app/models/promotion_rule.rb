class PromotionRule < ApplicationRecord
  belongs_to :promotion
  validates :type, presence: true

  def eligible?(_order)
    raise NotImplementedError, "Subclasses must implement `eligible?`"
  end
end
