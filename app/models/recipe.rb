class Recipe < ActiveRecord::Base
	has_many :ingredients
	has_many :users, through: :ingredients
end