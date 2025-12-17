class CreateLoyaltyStamps < ActiveRecord::Migration[7.2]
  def change
    create_table :loyalty_stamps do |t|
      t.references :business_customer, foreign_key: true, index: true
      t.references :loyalty_loyalty_setting, foreign_key: true, index: true
      t.timestamps
    end
  end
end
