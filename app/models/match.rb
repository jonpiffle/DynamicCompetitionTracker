class Match < ActiveRecord::Base
  attr_accessible :loser_id, :winner_id, :id
  has_many :game_sets
  belongs_to :hangout
  has_one :league, :through => :hangout
  belongs_to :loser, :class_name => "Team"
  belongs_to :winner, :class_name => "Team"

  def set_winner
  	if game_sets.count > (league.sets_per_match/2)
  		winner = Hash[*game_sets.group_by(&:winner).map {|k,v| [k, v.length]}.flatten!].max_by{|k,v| v}.first
  		loser = Hash[*game_sets.group_by(&:loser).map {|k,v| [k, v.length]}.flatten!].max_by{|k,v| v}.first
		self.update_attributes(:winner_id => winner.id, :loser_id => loser.id)
		true
	else
		false
  	end
  end

 end
