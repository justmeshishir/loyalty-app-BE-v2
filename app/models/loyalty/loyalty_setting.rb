module Loyalty
  class LoyaltySetting < ApplicationRecord
    belongs_to :business

    enum :status, { draft: 0, active: 1, pause: 2 }

    validates_presence_of :rules
  end
end


