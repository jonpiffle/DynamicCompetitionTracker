class CreatePlaysIns < ActiveRecord::Migration
  def change
    create_table :plays_ins do |t|
      t.integer :game_id
      t.integer :team_id
      t.boolean :won

      t.timestamps
    end
  end
end
