class RenameSessionsEverywhere < ActiveRecord::Migration
  def up
  	rename_column :sessions_teams, :session_id, :hangout_id
  	rename_column :matches, :session_id, :hangout_id
  	rename_table :sessions_teams, :hangouts_teams
  end

  def down
  	rename_table :hangouts_teams, :sessions_teams
  	rename_column :matches, :hangout_id, :session_id
  	rename_column :sessions_teams, :hangout_id, :session_id
  end
end
