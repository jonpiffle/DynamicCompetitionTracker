class Player < ActiveRecord::Base
  attr_accessible :name, :username, :solo_id
  has_and_belongs_to_many :teams
  belongs_to :solo, :class_name => "Team"

  after_create :create_solo 
  
  validates :username, :uniqueness => true, :presence => true

  def create_solo
    t = Team.create(:name => "#{name}(#{username})")
  	self.update_attributes(:solo_id => t.id)
  end

  def name_username
  	"#{name}(#{username})"
  end
end
