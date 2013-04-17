class ScoreType < ActiveRecord::Base
  attr_accessible :competition_id, :name, :mandatory, :high_scored
  belongs_to :competition
  has_many :scores
end
