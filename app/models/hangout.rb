class Hangout < ActiveRecord::Base
  attr_accessible :league_id, :teams_names
  belongs_to :league
  has_and_belongs_to_many :teams
  has_many :matches

  attr_accessor :player_names
end
