class PromotionAction < ApplicationRecord
  belongs_to :promotion
  validates :type, presence: true

  def perform(_order)
    raise NotImplementedError, "Subclasses must implement `perform`"
  end
end
