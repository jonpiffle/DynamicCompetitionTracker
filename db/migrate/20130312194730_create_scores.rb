class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :score_type_id
      t.string :score_value

      t.timestamps
    end
  end
end
