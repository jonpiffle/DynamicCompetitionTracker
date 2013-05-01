class CreateSessionsTeamsTable < ActiveRecord::Migration
  def up
  	create_table :sessions_teams, :id => false do |t|
      t.integer :session_id
      t.integer :team_id
    end
  end

  def down
  	drop_table :sessions_teams
  end
end
