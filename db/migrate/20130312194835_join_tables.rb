class JoinTables < ActiveRecord::Migration
  def change
    create_table :leagues_teams, :id => false do |t|
      t.integer :league_id
      t.integer :team_id
    end
    create_table :teams_players, :id => false do |t|
      t.integer :team_id
      t.integer :player_id
    end
  end
end
