class Customer < ApplicationRecord
  has_many :business_customers, dependent: :destroy
  has_many :businesses, through: :business_customers

  enum :gender, { male: 0, female: 1, other: 2 }
end
