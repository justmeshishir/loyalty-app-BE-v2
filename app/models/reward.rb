class Reward < ApplicationRecord
  belongs_to :business_customer
  belongs_to :loyalty_setting, class_name: "Loyalty::LoyaltySetting", foreign_key: "loyalty_loyalty_setting_id"
end
