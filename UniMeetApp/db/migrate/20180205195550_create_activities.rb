class CreateActivities < ActiveRecord::Migration[5.1]
  def change
  	create_table :activities do |t|
      ## Database authenticatable
      t.string :name, null:false
      t.integer :project_owner_id
      #t.references :project_owner, null:false
      t.text :description, null:false
   	  t.datetime :recruitment_deadline, null: true
      t.integer :max_size, null: false #we don't want to allow 0 as a max size
      t.text :activity_logo_url
      t.string :requirements, array:true, default: []
      #t.references "members", array:true, default: []
      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end
  end
end
