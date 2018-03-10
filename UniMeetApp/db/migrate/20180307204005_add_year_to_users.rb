class AddCruzidToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :academic_year, :string 
  end
end
