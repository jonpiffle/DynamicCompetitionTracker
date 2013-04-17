require 'statistics'
class PlaysIn < ActiveRecord::Base
  attr_accessible :game_id, :team_id, :won
  belongs_to :game
  belongs_to :team
  has_many :scores

  def league
  	game.league
  end

  def opponent
  	game.teams.where("team_id <> ?", team.id).first
  end

  def actual_score
  	won ? 1 : 0
  end

  def delta_rating
  	25*(actual_score-team.expected_score(opponent, league)) + bonus
  end

  def bonus
    5*scores.collect(&:z_score).avg
  end

  def update_team_rating
  	r = team.registration(league)
  	r.update_attributes(:rating => (r.rating + delta_rating))
  end
end
