class Superhero < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :bio, presence: true
	validates :height, presence: true

	has_many :superhero_team_pairings, dependent: :destroy
	has_many :teams, through: :superhero_team_pairings
end
