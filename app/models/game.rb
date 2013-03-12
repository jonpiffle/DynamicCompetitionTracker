class Game < ActiveRecord::Base
  attr_accessible :game_set_id
  belongs_to :game_set
  has_many :plays_ins
  #has_many :teams, :through => :plays_ins
  #has_many :scores, :through => :plays_ins
end
