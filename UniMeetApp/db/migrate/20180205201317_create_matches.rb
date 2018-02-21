class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
    	t.integer :user_id, null:false
    	t.integer :activity_id, null:false
    end
  end
end
