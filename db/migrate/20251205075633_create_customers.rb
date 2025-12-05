class CreateCustomers < ActiveRecord::Migration[7.2]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :phone, null: false
      t.date :dob
      t.string :address
      t.integer :gender
      t.boolean :active, default: false
      t.text :notes, default: ""

      t.timestamps
    end
  end
end
