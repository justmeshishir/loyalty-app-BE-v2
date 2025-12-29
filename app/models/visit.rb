class Visit < ApplicationRecord
  belongs_to :business_customer, counter_cache: true
end
