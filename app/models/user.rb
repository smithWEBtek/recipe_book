class User < ActiveRecord::Base
	has_secure_password
	has_many :ingredients
	has_many :recipes, through: :ingredients
	validates :name, presence: true, length: { maximum: 20 }
	validates :password_digest, presence: true
end