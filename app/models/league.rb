class League < ActiveRecord::Base
  attr_accessible :competition_id, :games_per_set, :name, :sets_per_match, :league_type
  belongs_to :competition
  has_and_belongs_to_many :teams
  has_many :sessions
end
