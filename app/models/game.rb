class Game < ActiveRecord::Base
  attr_accessible :game_set_id
  belongs_to :game_set
  has_many :plays_ins
  has_many :teams, :through => :plays_ins
  has_many :scores, :through => :plays_ins

  after_create :update_teams_ratings

  def session
  	game_set.match.session
  end

  def league
  	session.league
  end

  def update_teams_ratings
  	plays_ins.each do |p|
  		p.update_team_rating
  	end
  end
end
