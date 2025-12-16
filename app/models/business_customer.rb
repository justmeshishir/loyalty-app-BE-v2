class BusinessCustomer < ApplicationRecord
  belongs_to :business
  belongs_to :customer

  has_many :stamps, class_name: "Loyalty::Stamp"
end
