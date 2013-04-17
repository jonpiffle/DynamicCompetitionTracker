require 'statistics'
class Score < ActiveRecord::Base
  attr_accessible :score_type_id, :score_value
  belongs_to :plays_in
  belongs_to :score_type

  def z_score
  	siblings.collect(&:score_value).z_score(score_value)
  end

  def siblings
  	score_type.scores
  end
end
