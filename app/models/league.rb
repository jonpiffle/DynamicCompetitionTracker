require 'statistics'
class League < ActiveRecord::Base
  attr_accessible :competition_id, :games_per_set, :name, :sets_per_match, :league_type, :teams_names
  belongs_to :competition
  has_many :score_types, :through => :competition
  has_many :registrations
  has_many :teams, :through => :registrations
  has_many :hangouts
  has_many :matches, :through => :hangouts
  has_many :game_sets, :through => :matches
  has_many :games, :through => :game_sets
  
  attr_accessor :teams_names

  def structured
  	league_type == "Structured"
  end

  def ratings
  	registrations.collect(&:rating)
  end
end