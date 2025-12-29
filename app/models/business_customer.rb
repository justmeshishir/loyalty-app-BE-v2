class BusinessCustomer < ApplicationRecord
  belongs_to :business
  belongs_to :customer

  has_many :stamps, class_name: "Loyalty::Stamp", dependent: :destroy
  has_many :points, class_name: "Loyalty::Point", dependent: :destroy
  has_many :discounts, class_name: "Loyalty::Discount", dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_many :visits, dependent: :destroy

  def collected_stamps(loyalty_setting_id)
    stamps.for_loyalty(loyalty_setting_id).not_expired
  end

  def total_points(loyalty_setting_id)
    points.for_loyalty(loyalty_setting_id).sum(:value)
  end
end
