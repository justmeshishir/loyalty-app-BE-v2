class BusinessCustomer < ApplicationRecord
  belongs_to :business
  belongs_to :customer

  has_many :stamps, class_name: "Loyalty::Stamp", dependent: :destroy

  def collected_stamps(loyalty_loyalty_setting_id)
    stamps.where(loyalty_loyalty_setting_id:).size
  end
end
