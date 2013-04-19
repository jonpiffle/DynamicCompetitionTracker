class AddPrimaryToScoreType < ActiveRecord::Migration
  def change
  	add_column :score_types, :primary, :boolean
  end
end
