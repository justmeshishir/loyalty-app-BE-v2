class Loyalty::Stamp < ApplicationRecord
  belongs_to :business_customer
  belongs_to :stamp_setting, class_name: "Loyalty::StampSetting", foreign_key: "loyalty_loyalty_setting_id"

  after_create :set_reward!, if: :eligible_for_reward?

  def total_stamps
    stamp_setting.rules["num_of_stamps"].to_i
  end

  private

  def eligible_for_reward?
    # return false if still_valid? # Todo: define still_valid? based on valid days
    business_customer.collected_stamps(loyalty_loyalty_setting_id) == total_stamps
  end

  def set_reward!
    # create a reward entry
    # set all stamps to expired: true
  end
end
