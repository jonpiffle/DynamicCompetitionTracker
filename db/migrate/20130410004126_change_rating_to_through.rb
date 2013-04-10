class ChangeRatingToThrough < ActiveRecord::Migration
  def up
  	drop_table :leagues_teams
  	create_table :registrations do |t|
  		t.timestamps
  		t.integer :league_id
  		t.integer :team_id
  		t.integer :rating
  	end
  end

  def down
  	drop_table :registrations
  	create_table :leagues_teams, :id => false do |t|
      t.integer :league_id
      t.integer :team_id
    end
  	end
end
