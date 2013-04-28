require 'statistics'
class PlaysIn < ActiveRecord::Base
  attr_accessible :game_id, :team_id, :won, :scores_attributes, :player_names
  belongs_to :game
  has_one :game_set, :through => :game
  has_one :match, :through => :game_set
  has_one :hangout, :through => :match
  has_one :league, :through => :hangout
  belongs_to :team
  has_many :scores

  accepts_nested_attributes_for :scores
  attr_accessor :player_names

  def opponent
  	game.teams.where("team_id <> ?", team.id).first
  end

  def build_scores(l)
    s = []
    l.score_types.each do |st|
      s << self.scores.build(:score_type_id => st.id)
    end
    s
  end

  def actual_score
  	won ? 1 : 0
  end

  def delta_rating
    25*(actual_score-team.expected_score(opponent, league)) + bonus
  end

  def bonus
    scores.collect(&:z_score).compact.size == 0 ? 0 : 5*scores.collect(&:z_score).compact.avg 
  end

  def update_team_rating
  	r = team.registration(league)
  	r.update_attributes(:rating => (r.rating + delta_rating))
  end
end
