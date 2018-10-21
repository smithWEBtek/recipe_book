class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def search
    @recipes = Recipe.search(params[:search])
  end

  def show
    @user = current_user
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @ingredients = 10.times.collect { @recipe.recipe_ingredients.build }
  end

  def create
    recipe = current_user.recipes.new(recipe_params)
    if Recipe.valid_entry(params)
      recipe.save
      recipe.add_ingredients(recipe_ingredient_params)
      redirect_to recipe_path(recipe)
    else
      redirect_to new_recipe_path, notice: "Make sure all fields are complete"
    end
  end


  def edit
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe.user
      recipe = 1.times.collect { @recipe.recipe_ingredients.build }
    else
      redirect_to recipes_path
    end
  end

  def update
    own_recipes
    binding.pry
    recipe = Recipe.find_by(id: params[:id])
    if recipe.update(recipe_params)
      recipe.add_ingredients(recipe_ingredient_params)
      redirect_to recipe_path(recipe), notice: "Your recipe has successfully been updated"
    else  
      redirect_to new_recipe_path, alert: recipe.errors.full_messages.each {|m| m}.join
    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy!
    redirect_to recipes_path
  end

  def sort_by_category
    @recipes = Recipe.category
    render "recipes/index"
  end

  def find_newest
    @recipes = Recipe.newest
    render "recipes/index"
  end

  def find_quickest
    @recipes = Recipe.quickest 
    render "recipes/index"
  end

  def most_ingredients
    @recipes = Recipe.most_ingredients
    render "recipes/index"
  end

  def least_ingredients
    @recipes = Recipe.least_ingredients
    render "recipes/index"
  end



  private


  def recipe_params
    params.require(:recipe).permit(:title, :category, :directions, :cook_time, :search)
  end
  
  def recipe_ingredient_params
    params.require(:recipe).permit(recipe_ingredients_attributes: [:amount, :ingredient_id, ingredient: [:name]])
  end


end