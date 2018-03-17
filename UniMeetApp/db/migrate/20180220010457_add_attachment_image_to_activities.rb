class AddAttachmentImageToActivities < ActiveRecord::Migration[5.1]
  def self.up
    change_table :activities do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :activities, :image
  end
end
