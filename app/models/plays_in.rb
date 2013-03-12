class PlaysIn < ActiveRecord::Base
  attr_accessible :game_id, :team_id, :won
  belongs_to :game
  belongs_to :team
  has_many :scores
end
