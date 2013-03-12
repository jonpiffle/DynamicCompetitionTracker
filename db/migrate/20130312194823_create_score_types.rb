class CreateScoreTypes < ActiveRecord::Migration
  def change
    create_table :score_types do |t|
      t.integer :competition_id
      t.string :name
      t.string :logic

      t.timestamps
    end
  end
end
