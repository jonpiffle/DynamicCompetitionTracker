class GameSet < ActiveRecord::Base
  attr_accessible :loser_id, :match_id, :winner_id, :id
  has_many :games
  belongs_to :match
  has_one :hangout, :through => :match
  has_one :league, :through => :hangout
  belongs_to :loser, :class_name => "Team"
  belongs_to :winner, :class_name => "Team"

  def set_winner
  	if Hash[*games.group_by(&:winner).map {|k,v| [k, v.length]}.flatten!].max_by{|k,v| v}[1] > (league.games_per_set/2)
  		winner = Hash[*games.group_by(&:winner).map {|k,v| [k, v.length]}.flatten!].max_by{|k,v| v}.first
  		loser = Hash[*games.group_by(&:loser).map {|k,v| [k, v.length]}.flatten!].max_by{|k,v| v}.first
			self.update_attributes(:winner_id => winner.id, :loser_id => loser.id)
		true
	else
		false
  	end
  end

  def wins_counts
    teams = games.first.teams
    team1 = teams.first
    team2 = teams.last

    wins = Hash[*games.group_by(&:winner).map {|k,v| [k, v.length]}.flatten!]

    team1_wins = wins[team1] || 0
    team2_wins = wins[team2] || 0

    data = []

    data << team1
    data << team1_wins
    data << team2
    data << team2_wins
    data
  end

end
