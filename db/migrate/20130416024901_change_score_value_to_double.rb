class ChangeScoreValueToDouble < ActiveRecord::Migration
  def up
  	change_column :scores, :score_value, :double
  end

  def down
  	change_column :scores, :score_value, :string
  end
end
