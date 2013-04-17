class Registration < ActiveRecord::Base
	attr_accessible :rating, :team_id, :league_id
	belongs_to :team
	belongs_to :league

	after_create :set_default_rating

	def set_default_rating
		self.update_attributes(:rating => 1200)
	end
end