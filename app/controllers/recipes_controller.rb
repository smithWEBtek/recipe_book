class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update]

  def index
    @recipes = Recipe.all
    @recipe = current_user.recipes.build
  end

  def show
    @user = current_user
    @recipe = Recipe.find_by(id: params[:id])
  end


  def new
    @recipe = Recipe.new
    @ingredients = 10.times.collect { @recipe.recipe_ingredients.build }
  end

  def create
    recipe = current_user.recipes.new(recipe_params)
      if recipe.save
        recipe.add_ingredients(recipe_ingredient_params)
        redirect_to recipe_path(recipe)
      else
        @recipe = Recipe.new
        redirect_to new_recipe_path
    end
  end


  def edit
    @recipe = find_by_id(Recipe)
    @i = 3.times.collect { @recipe.recipe_ingredients.build }
  end

  def update
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.delete
    redirect_to recipes_path
  end


  private


  def recipe_params
    params.require(:recipe).permit(:title, :category, :directions, :cook_time)
  end
  
  def recipe_ingredient_params
    params.require(:recipe).permit(recipe_ingredients_attributes: [:amount, :ingredient_id, ingredient: [:name]])
  end

  def find_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end


end