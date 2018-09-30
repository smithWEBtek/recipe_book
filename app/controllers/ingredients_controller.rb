class IngredientsController <ApplicationController
	def index
 		@ingredients = Ingredient.all
  	end
 
 	def search
  		if params[:recipe_ingredient]
    		@recipe = Recipe.where('ingredient LIKE ?', "%#{params[:recipe_ingredient]}%")
  		else
    		@recipe = Recipe.all
  		end
	end

	def find

	end

end