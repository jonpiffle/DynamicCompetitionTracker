class Team < ActiveRecord::Base
  attr_accessible :name, :rating
  has_and_belongs_to_many :players
  has_and_belongs_to_many :leagues
  has_many :plays_ins
  #has_many :games, :through => :plays_ins
  #has_many :scores, :through => :plays_ins
end
