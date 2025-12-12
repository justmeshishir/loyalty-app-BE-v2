class CreateLoyaltyLoyaltySettings < ActiveRecord::Migration[7.2]
  def change
    create_table :loyalty_loyalty_settings do |t|
      t.string "offer_name", null: false
      t.integer "status", default: 0
      t.integer "valid_days"
      t.string "type", comment: "Loyalty Plan type Stamp, Discount or Point"
      t.jsonb "rules", null: false
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end

