class ChangeRatingToDouble < ActiveRecord::Migration
  def up
  	change_column :registrations, :rating, :decimal
  end

  def down
  	change_column :registrations, :rating, :integer
  end
end
