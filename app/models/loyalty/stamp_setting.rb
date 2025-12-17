module Loyalty
  class StampSetting < LoyaltySetting
    STAMP_JSON_SCHEMA = Rails.root.join("config", "schemas", "stamp_setting.json")

    validates :rules, presence: true, json: { schema: STAMP_JSON_SCHEMA }

    def total_stamps_needed
      rules["num_of_stamps"].to_i
    end
  end
end
