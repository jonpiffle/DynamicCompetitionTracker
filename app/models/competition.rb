class Competition < ActiveRecord::Base
  attr_accessible :name
  has_many :leagues
  has_many :score_types
end
