class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :activity_id
      t.boolean :ownership
      t.timestamps
    end
  end
end
