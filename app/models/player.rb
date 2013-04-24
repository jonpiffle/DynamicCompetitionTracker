class Player < ActiveRecord::Base
  attr_accessible :name, :username
  has_and_belongs_to_many :teams

  after_create :create_one_player_team 
  
  validates :username, :uniqueness => true, :presence => true

  def create_one_player_team
  	self.teams.create
  end

  def name_username
  	"#{name}(#{username})"
  end
end
