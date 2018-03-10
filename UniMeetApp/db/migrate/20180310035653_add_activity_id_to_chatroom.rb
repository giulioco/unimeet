class AddActivityIdToChatroom < ActiveRecord::Migration[5.1]
  def change
    add_column :chatrooms, :activity_id, :integer, :default => nil 
  end
end
