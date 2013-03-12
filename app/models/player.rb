class Player < ActiveRecord::Base
  attr_accessible :name, :username
  has_and_belongs_to_many :teams
end
