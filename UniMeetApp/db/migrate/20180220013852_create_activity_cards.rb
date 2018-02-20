class CreateActivityCards < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_cards do |t|
      t.integer :activity_id

      t.timestamps
    end
  end
end
