class RenameSessions < ActiveRecord::Migration
  def up
  	rename_table :sessions, :hangouts
  end

  def down
  	rename_table :hangouts, :sessions
  	  end
end
