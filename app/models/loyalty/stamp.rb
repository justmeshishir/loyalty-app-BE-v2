class Loyalty::Stamp < ApplicationRecord
  belongs_to :business_customer
  belongs_to :stamp_setting, class_name: "Loyalty::StampSetting", foreign_key: "loyalty_loyalty_setting_id"

  before_destroy :check_expired
  after_create :set_reward!, if: :eligible_for_reward?

  alias_attribute :stamp_setting_id, :loyalty_loyalty_setting_id

  scope :not_expired, -> { where(expired: false) }
  scope :for_loyalty, ->(stamp_setting_id) { where(loyalty_loyalty_setting_id: stamp_setting_id) }

  private

  def eligible_for_reward?
    # return false if still_valid? # Todo: define still_valid? based on valid days
    business_customer.collected_stamps(stamp_setting_id).size == stamp_setting.total_stamps_needed
  end

  def check_expired
    if self[:expired]
      errors.add(:expired, "cannot be deleted ")
      throw(:abort)
    end
  end

  def set_reward!
    business_customer.rewards.create!(loyalty_loyalty_setting_id: stamp_setting_id)
    business_customer.collected_stamps(stamp_setting_id).update_all(expired: true)
  end
end
