class Reward < ApplicationRecord
  belongs_to :business_customer
  belongs_to :stamp_setting, class_name: "Loyalty::StampSetting", foreign_key: "loyalty_loyalty_setting_id", optional: true
  belongs_to :discount_setting, class_name: "Loyalty::DiscountSetting", foreign_key: "loyalty_loyalty_setting_id", optional: true
  belongs_to :point_setting, class_name: "Loyalty::PointSetting", foreign_key: "loyalty_loyalty_setting_id", optional: true
end
