class RenameTeamsPlayers < ActiveRecord::Migration
  def up
  	rename_table :teams_players, :players_teams
  end

  def down
  	rename_table :players_teams, :teams_players
  end
end
