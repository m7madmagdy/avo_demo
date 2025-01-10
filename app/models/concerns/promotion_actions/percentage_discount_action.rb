module PromotionActions
  class PercentageDiscountAction < PromotionAction
    def perform(order)
      discount = order.total * (preferences["percentage"] / 100.0)
      order.update(total_after_discounts: order.total - discount)
    end
  end
end
