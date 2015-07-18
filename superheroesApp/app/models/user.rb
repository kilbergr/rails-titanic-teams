class User < ActiveRecord::Base
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true
	has_many :teams, dependent: :delete
	has_secure_password
end
