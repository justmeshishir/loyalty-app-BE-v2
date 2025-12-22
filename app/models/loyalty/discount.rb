class Loyalty::Discount < ApplicationRecord
  belongs_to :business_customer
  belongs_to :discount_setting, class_name: "Loyalty::DiscountSetting", foreign_key: "loyalty_loyalty_setting_id"

  alias_attribute :discount_setting_id, :loyalty_loyalty_setting_id

  # before_create :set_visit
  # before_create :set_discount_amount

  validates_presence_of :visit_number
end
