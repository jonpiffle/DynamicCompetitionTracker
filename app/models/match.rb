class Match < ActiveRecord::Base
  attr_accessible :loser_id, :winner_id, :id
  has_many :game_sets
  belongs_to :hangout
  has_one :league, :through => :hangout
  belongs_to :loser, :class_name => "Team"
  belongs_to :winner, :class_name => "Team"
 end
