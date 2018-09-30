class IngredientsController <ApplicationController
  
 def index
 	@ingredients = Ingredient.all

  if params[:recipe_ingredient]
  	binding.pry
    @recipe = Recipe.where('ingredient LIKE ?', "%#{params[:recipe_ingredient]}%")
  else
    @recipe = Recipe.all
  end
end

end