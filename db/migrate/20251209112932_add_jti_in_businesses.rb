class AddJtiInBusinesses < ActiveRecord::Migration[7.2]
  def change
    add_column :businesses, :jti, :string, null: false
    add_index :businesses, :jti, unique: true
  end
end
