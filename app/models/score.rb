class Score < ActiveRecord::Base
  attr_accessible :score_type_id, :score_value
  belongs_to :plays_in
  belongs_to :score_type
end
