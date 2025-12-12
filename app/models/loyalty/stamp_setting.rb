module Loyalty
  class StampSetting < LoyaltySetting
    STAMP_JSON_SCHEMA = Rails.root.join("config", "schemas", "stamp_setting.json")

    validates :rules, presence: true, json: { schema: STAMP_JSON_SCHEMA }
  end
end
