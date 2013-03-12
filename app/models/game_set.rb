class GameSet < ActiveRecord::Base
  attr_accessible :loser_id, :match_id, :winner_id
  has_many :games
  belongs_to :match
  belongs_to :loser, :class_name => "Team"
  belongs_to :winner, :class_name => "Team"
end
