class Registration < ActiveRecord::Base
	attr_accessible :rating
	belongs_to :team
	belongs_to :league
end