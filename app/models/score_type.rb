class ScoreType < ActiveRecord::Base
  attr_accessible :competition_id, :logic, :name
  belongs_to :competition
  has_many :scores
end
