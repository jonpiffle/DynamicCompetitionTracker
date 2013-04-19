class GameSet < ActiveRecord::Base
  attr_accessible :loser_id, :match_id, :winner_id, :id
  has_many :games
  belongs_to :match
  has_one :hangout, :through => :match
  has_one :league, :through => :hangout
  belongs_to :loser, :class_name => "Team"
  belongs_to :winner, :class_name => "Team"
end
