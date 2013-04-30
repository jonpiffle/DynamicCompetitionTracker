class ScoreType < ActiveRecord::Base
  attr_accessible :competition_id, :name, :mandatory, :high_scored, :primary
  belongs_to :competition
  has_many :scores

  def multiplier
  	high_scored ? 1 : -1
  end
end
