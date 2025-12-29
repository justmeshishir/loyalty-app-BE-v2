module Loyalty
  class LoyaltySetting < ApplicationRecord
    belongs_to :business

    enum :status, { draft: 0, active: 1, pause: 2 }

    validates_presence_of :rules
    validate :check_if_any_active?, on: :update, if: :status_changed?

    private

    def check_if_any_active?
      if business.loyalty_settings.where.not(id: self.id).active.exists?
        errors.add(:business, "already has an active loyalty setting. Disable it first to activate this.")
      end
    end
  end
end


