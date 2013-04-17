class Session < ActiveRecord::Base
  attr_accessible :league_id, :teams_names
  belongs_to :league
  has_many :teams
  has_many :matches

  attr_accessor :teams_names
end
