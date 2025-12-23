class CreateVisits < ActiveRecord::Migration[7.2]
  def change
    create_table :visits do |t|
      t.references :business_customer
      t.text :note
      t.decimal :amount_spent, precision: 12, scale: 2
      t.timestamps
    end
  end
end
