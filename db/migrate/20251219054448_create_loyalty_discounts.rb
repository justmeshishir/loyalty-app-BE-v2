class CreateLoyaltyDiscounts < ActiveRecord::Migration[7.2]
  def change
    create_table :loyalty_discounts do |t|
      t.references :business_customer, foreign_key: true, index: true
      t.references :loyalty_loyalty_setting, foreign_key: true, index: true
      t.integer :visit_number, null: false
      t.decimal :discounted_amount, precision: 12, scale: 2
      t.timestamps
    end
  end
end
