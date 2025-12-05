class CreateBusinesses < ActiveRecord::Migration[7.2]
  def change
    create_table :businesses do |t|
      t.string :name, null: false
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone, null: false
      t.string :industry
      t.string :logo_url
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
