class League < ActiveRecord::Base
  attr_accessible :competition_id, :games_per_set, :name, :sets_per_match, :league_type
  belongs_to :competition
  has_many :registrations
  has_many :teams, :through => :registrations
  has_many :sessions
end
