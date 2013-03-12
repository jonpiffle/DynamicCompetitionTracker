class Session < ActiveRecord::Base
  attr_accessible :league_id
  belongs_to :league
  has_many :teams
  has_many :matches
end
