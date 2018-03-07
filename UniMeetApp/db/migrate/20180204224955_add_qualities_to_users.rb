class AddQualitiesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string, :null => false 
    add_column :users, :last_name, :string, :null => false
    add_column :users, :bio, :text, default: ""
    add_column :users, :college_location, :string, default: ""
    add_column :users, :major, :string, default: ""
    # add_column :users, :matches, :references, array:true, default:[]
  end
end
