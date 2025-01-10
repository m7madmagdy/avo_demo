module PromotionRules
  class UserEligibilityRule < PromotionRule
    def eligible?(order)
      preferences["eligible_user_ids"].include?(order.user_id)
    end
  end
end
