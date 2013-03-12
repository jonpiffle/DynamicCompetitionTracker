class ChangeLeagueType < ActiveRecord::Migration
  def up
    rename_column :leagues, :type, :league_type
  end

  def down
    rename_column :leagues, :league_type, :type
  end
end
