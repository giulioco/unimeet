class AddQualitiesToLikes < ActiveRecord::Migration[5.1]
  def change
    remove_column :likes, :like_id
    remove_column :likes, :liked_id
    remove_column :likes, :user_id
    add_column :likes, :user_id, :int
    add_column :likes, :activity_id, :int
    add_column :likes, :user_likes_activity, :boolean
    add_column :likes, :activity_likes_user, :boolean
  end
end
