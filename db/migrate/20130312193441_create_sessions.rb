class CreateHangouts < ActiveRecord::Migration
  def change
    create_table :hangouts do |t|
      t.integer :league_id

      t.timestamps
    end
  end
end
