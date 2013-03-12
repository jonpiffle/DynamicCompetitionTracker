class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :type
      t.integer :games_per_set
      t.integer :sets_per_match
      t.integer :competition_id

      t.timestamps
    end
  end
end
