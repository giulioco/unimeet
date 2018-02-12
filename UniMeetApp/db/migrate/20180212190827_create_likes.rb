class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.string :like_id, null:false
      t.string :user_id, null:false
      t.string :liked_id, null:false
      t.timestamps
    end
  end
end
