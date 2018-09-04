class RecipeIngredient < ActiveRecord::Base
	belongs_to :ingredient
	belongs_to :recipe

	def search_recipes(item)
		

	end

end