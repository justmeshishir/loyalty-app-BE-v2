class Loyalty::Point < ApplicationRecord
  belongs_to :business_customer
  belongs_to :point_setting, class_name: "Loyalty::PointSetting", foreign_key: "loyalty_loyalty_setting_id"

  alias_attribute :point_setting_id, :loyalty_loyalty_setting_id

  validates :value, numericality: true
  validates_presence_of :loyalty_loyalty_setting_id

  scope :for_loyalty, ->(point_setting_id) { where(loyalty_loyalty_setting_id: point_setting_id) }

  before_create :set_point_value
  after_create :set_reward!, if: :eligible_for_reward?

  private

  def set_point_value
    amount_needed = point_setting.rules["amount_spent"]
    return 0 if amount_spent < amount_needed

    points_given = point_setting.rules["points_given"]
    receivable_points = (points_given.to_f / amount_needed) * amount_spent

    self[:value] = receivable_points.round
  end

  def eligible_for_reward?
    rewardable_points = point_setting.rules["reward_point"].to_i
    business_customer.total_points(point_setting_id) >= rewardable_points
  end

  def set_reward!
    business_customer.rewards.create!(loyalty_loyalty_setting_id: point_setting_id)
    rewarded_points = point_setting.rules["reward_point"].to_i
    business_customer.points.create!(value: -rewarded_points, amount_spent: 0.0, loyalty_loyalty_setting_id: point_setting_id)
  end
end
