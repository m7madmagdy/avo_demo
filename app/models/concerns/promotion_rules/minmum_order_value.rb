module PromotionRules
  class MinimumOrderValueRule < PromotionRule
    def eligible?(order)
      order.total >= preferences["minimum_order_value"]
    end
  end
end
