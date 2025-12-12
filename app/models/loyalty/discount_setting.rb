module Loyalty
  class DiscountSetting < LoyaltySetting
    DISCOUNT_JSON_SCHEMA = Rails.root.join("config", "schemas", "discount_setting.json")

    validates :rules, presence: true, json: { schema: DISCOUNT_JSON_SCHEMA }
  end
end
