class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :rating
      t.string :name

      t.timestamps
    end
  end
end
