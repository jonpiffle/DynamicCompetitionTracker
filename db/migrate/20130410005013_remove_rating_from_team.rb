class RemoveRatingFromTeam < ActiveRecord::Migration
  def up
  	remove_column :teams, :rating
  end

  def down
  	add_column :teams, :rating, :integer
  end
end
