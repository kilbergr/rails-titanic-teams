class Team < ActiveRecord::Base
	validates :name, presence:true
	validates :description, presence: true
	validates :user_id, presence: true
	
	has_many :superhero_team_pairings, dependent: :destroy
	has_many :superheros, through: :superhero_team_pairings

	belongs_to :user
end
