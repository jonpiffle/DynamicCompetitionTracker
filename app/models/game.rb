class Game < ActiveRecord::Base
  attr_accessible :game_set_id, :plays_ins_attributes
  belongs_to :game_set
  has_one :match, :through => :game_set
  has_one :hangout, :through => :match
  has_one :league, :through => :hangout
  has_many :plays_ins
  has_many :teams, :through => :plays_ins
  has_many :scores, :through => :plays_ins


  accepts_nested_attributes_for :plays_ins

  after_create :update_teams_ratings

  def update_teams_ratings
  	plays_ins.each do |p|
  		p.update_team_rating
  	end
  end
end
