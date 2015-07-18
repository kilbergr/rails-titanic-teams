class Team < ActiveRecord::Base
	
	validates :description, presence: true
	
	has_many :superhero_team_pairings, dependent: :destroy
	has_many :tags, through: :superhero_team_pairings

	belongs_to :user
end
