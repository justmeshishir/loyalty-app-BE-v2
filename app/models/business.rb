class Business < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  # Available Loyalty Settings
  # has_many :loyalty_settings, class_name: "Loyalty::LoyaltySetting"
  has_many :stamp_settings, class_name: "Loyalty::StampSetting", dependent: :destroy
  has_many :discount_settings, class_name: "Loyalty::DiscountSetting", dependent: :destroy
  has_many :point_settings, class_name: "Loyalty::PointSetting", dependent: :destroy

  has_many :business_customers,  dependent: :destroy
  has_many :customers, through: :business_customers

  validates_presence_of :name, :phone
end
