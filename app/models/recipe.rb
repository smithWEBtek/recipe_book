class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients
  	has_many :ingredients, through: :recipe_ingredients
  	accepts_nested_attribute_for :recipe_ingredients
	 
end