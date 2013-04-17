class ChangeScoreType < ActiveRecord::Migration
  def up
  	remove_column :score_types, :logic
  	add_column :score_types, :mandatory, :boolean
  	add_column :score_types, :high_scored, :boolean
  end

  def down
  	add_column :score_types, :logic, :string
  	remove_column :score_types, :mandatory
  	remove_column :score_types, :high_scored
  end
end
