class ChangeScoreValueToDouble < ActiveRecord::Migration
  def up
#  	change_column :scores, :score_value, :float
    connection.execute(%q{
        alter table scores
        alter column score_value
        type float using score_value::float
    })
  end

  def down
  	change_column :scores, :score_value, :string
  end
end
