class BusinessCustomer < ApplicationRecord
  belongs_to :business
  belongs_to :customer

  has_many :stamps, class_name: "Loyalty::Stamp", dependent: :destroy
  has_many :rewards, dependent: :destroy

  def collected_stamps(loyalty_setting_id)
    stamps.for_loyalty(loyalty_setting_id).not_expired
  end
end
