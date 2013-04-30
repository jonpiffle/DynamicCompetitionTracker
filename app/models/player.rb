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

  def avg_rating
    ActiveRecord::Base.connection.execute("SELECT avg(r.rating)
        FROM players_teams pt, teams t, registrations r
        WHERE pt.player_id = 2 and pt.team_id = t.id and t.id = r.team_id
        GROUP BY pt.player_id").first.first.last
  end
end
