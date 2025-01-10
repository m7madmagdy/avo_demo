class Promotion < ApplicationRecord
  has_many :promotion_rules, dependent: :destroy
  has_many :promotion_actions, dependent: :destroy

  validates :name, :code, presence: true
  validates :code, uniqueness: true

  scope :active, -> { where(active: true).where("starts_at IS NULL OR starts_at <= ?", Time.zone.now).where("expires_at IS NULL OR expires_at >= ?", Time.zone.now) }

  def eligible?(order)
    promotion_rules.all? { |rule| rule.eligible?(order) }
  end

  def apply(order)
    return false unless eligible?(order)

    promotion_actions.each { |action| action.perform(order) }
    true
  end
end
