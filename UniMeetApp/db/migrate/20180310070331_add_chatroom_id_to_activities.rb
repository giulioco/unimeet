class AddChatroomIdToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :chatroom_id, :integer
  end
end
