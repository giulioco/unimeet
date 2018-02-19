class AddAttachmentImageToUsers < ActiveRecord::Migration[5.0]
  def self.up
    change_table :users do |t|
      t.attachment :image
    end
  end
  remove_column :users, :hobby
  def self.down
    remove_attachment :users, :image
  end
end
