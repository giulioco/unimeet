class CreateUserCards < ActiveRecord::Migration[5.1]
  def change
    create_table :user_cards do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
