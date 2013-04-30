class Team < ActiveRecord::Base
  attr_accessible :name, :rating, :players_names, :players_ids, :id
  has_and_belongs_to_many :players
  has_many :registrations
  has_many :leagues, :through => :registrations
  has_and_belongs_to_many :hangouts
  has_many :plays_ins
  has_many :games, :through => :plays_ins
  has_many :scores, :through => :plays_ins
	
  validates :name, :uniqueness => true, :presence => true

  attr_accessor :players_names, :players_ids

  def rival
    Team.find_by_sql(
      "SELECT wins.id, wins.name, MAX(wins.cnt) \
       FROM (SELECT T.id, T.name, count(*) as cnt \
       FROM teams T, matches M \
       WHERE M.winner_id = T.id AND M.loser_id = #{self.id} \
       GROUP BY T.id, T.name) as wins").first
  end

  def punching_bag
    Team.find_by_sql(
      "SELECT wins.id, wins.name, MAX(wins.cnt) \
      FROM (SELECT T.id, T.name, count(*) as cnt \
      FROM teams T, matches M \
      WHERE M.winner_id = #{self.id} AND M.loser_id = T.id \ 
      GROUP BY T.id ,T.name) as wins").first
  end

  def rating(league)
  	registrations.where(:league_id => league.id).first.rating.to_f
  end

  def registration(league)
  	registrations.where(:league_id => league.id).first
  end

  def expected_score(opponent, league)
  	1.0 / (1.0 + 10.0**((opponent.rating(league) - self.rating(league))/400.0))
  end
end
