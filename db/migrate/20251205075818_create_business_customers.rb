class CreateBusinessCustomers < ActiveRecord::Migration[7.2]
  def change
    create_table :business_customers do |t|
      t.references :business, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
