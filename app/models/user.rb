class User < ActiveRecord::Base
	has_secure_password
	has_many :options
	has_many :recipes, through: :options
end