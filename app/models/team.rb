class Team < ActiveRecord::Base
  attr_accessible :name, :rating, :players_names, :players_ids
  has_and_belongs_to_many :players
  has_many :registrations
  has_many :leagues, :through => :registrations
  has_and_belongs_to_many :hangouts
  has_many :plays_ins
  has_many :games, :through => :plays_ins
  has_many :scores, :through => :plays_ins
	
  validates :name, :uniqueness => true, :presence => true

  attr_accessor :players_names, :players_ids

  def rating(league)
  	registrations.where(:league_id => league.id).first.rating.to_f
  end

  def registration(league)
  	registrations.where(:league_id => league.id).first
  end

  def expected_score(opponent, league)
  	1.0 / (1.0 + 10.0**((opponent.rating(league) - self.rating(league))/400.0))
  end

  def self.find_solo_by_username(u)
    Player.find_by_username(u).solo_team
  end
end
