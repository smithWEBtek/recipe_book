class Ingredient < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipe

	def search_recipes(item)
		

	end

end