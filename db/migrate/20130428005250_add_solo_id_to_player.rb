class AddSoloIdToPlayer < ActiveRecord::Migration
  def change
  	add_column :players, :solo_id, :integer
  end
end
