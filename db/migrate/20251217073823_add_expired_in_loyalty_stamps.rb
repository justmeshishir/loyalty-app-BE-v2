class AddExpiredInLoyaltyStamps < ActiveRecord::Migration[7.2]
  def change
    add_column :loyalty_stamps, :expired, :boolean, default: false, null: false
  end
end
