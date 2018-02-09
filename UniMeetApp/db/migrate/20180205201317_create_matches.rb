class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
    	t.string :match_id, null:false
    	t.references :user, null:false
    	t.references :activity, null:false
    end
  end
end
