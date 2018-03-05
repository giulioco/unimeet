class AddTeamCountToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :team_count, :integer, :default => 1 
  end
end
