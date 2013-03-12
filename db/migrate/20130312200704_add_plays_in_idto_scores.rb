class AddPlaysInIdtoScores < ActiveRecord::Migration
  def change
    add_column :scores, :plays_in_id, :integer 
  end
end
