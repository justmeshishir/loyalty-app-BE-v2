class Customer < ApplicationRecord
  has_many :businesses

  enum :gender, { male: 0, female: 1, other: 2 }
end
