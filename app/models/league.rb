require 'statistics'
class League < ActiveRecord::Base
  attr_accessible :competition_id, :games_per_set, :name, :sets_per_match, :league_type, :teams_names, :player_names
  belongs_to :competition
  has_many :score_types, :through => :competition
  has_many :registrations, :dependent => :destroy
  has_many :teams, :through => :registrations
  has_many :hangouts
  has_many :matches, :through => :hangouts
  has_many :game_sets, :through => :matches
  has_many :games, :through => :game_sets

  attr_accessor :teams_names
  attr_accessor :player_names

  validates :name, :uniqueness => true, :presence => true

  attr_accessor :teams_names
  
  def above_average_teams
    Team.find_by_sql(
      "select t.id, t.name
      from teams t, (select count(m.winner_id) as cnt, m.winner_id
              from matches m, teams t1, hangouts h
              where m.winner_id=t1.id and m.hangout_id = h.id and h.league_id = #{self.id}
              group by m.winner_id) as r
      where t.id=r.winner_id 
    and r.cnt > (select avg(r1.cnt)
                 from (select count(winner_id) as cnt
                       from teams t, registrations r
                       left outer join (select m.winner_id
                                       from matches m, teams t1, hangouts h
                                       where m.winner_id=t1.id and m.hangout_id = h.id and h.league_id = #{self.id})
                    on t.id = winner_id
                    where t.id = r.team_id and r.league_id = #{self.id}
                    group by winner_id, t.id) as r1)")
  end

  def structured
  	league_type == "Structured"
  end

  def ratings
  	registrations.collect(&:rating)
  end
end
