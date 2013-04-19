class CreateHangoutsTeamsTable < ActiveRecord::Migration
  def up
  	create_table :hangouts_teams, :id => false do |t|
      t.integer :hangout_id
      t.integer :team_id
    end
  end

  def down
  	drop_table :hangouts_teams
  end
end
