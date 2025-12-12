module Loyalty
  class PointSetting < LoyaltySetting
    POINT_JSON_SCHEMA = Rails.root.join("config", "schemas", "point_setting.json")

    validates :rules, presence: true, json: { schema: POINT_JSON_SCHEMA }
  end
end
