class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.int :user_id
      t.int :activity_id
      t.boolean :user_likes_activity
      t.boolean :activity_likes_user
      t.timestamps
    end
  end
end
