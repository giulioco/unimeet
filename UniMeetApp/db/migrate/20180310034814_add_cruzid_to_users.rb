class AddCruzidToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cruzid, :string
    add_index :users, :cruzid, unique: true
  end
end
