class AddHangoutIdToMatch < ActiveRecord::Migration
  def change
  	add_column :matches, :hangout_id, :integer
  end
end
