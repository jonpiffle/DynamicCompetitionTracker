class AddSessionIdToMatch < ActiveRecord::Migration
  def change
  	add_column :matches, :session_id, :integer
  end
end
