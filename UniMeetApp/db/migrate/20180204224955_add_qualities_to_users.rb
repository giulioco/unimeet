class AddQualitiesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string, :null => false 
    add_column :users, :middle_name, :string, default: ""
    add_column :users, :last_name, :string, :null => false
    add_column :users, :profile_pic_url, :string, default: ""
    add_column :users, :bio, :text, default: ""
    add_column :users, :college_location, :string, default: ""
    # add_column :users, :interests, :string, array:true, default:[]
    # add_column :users, :matches, :references, array:true, default:[]
    add_column :users, :birthday, :date
  end
end
