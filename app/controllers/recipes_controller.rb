class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update]

  def index
    @recipes = Recipe.all
    @user= current_user
  end
# def index
#     if params[:artist_id]
#       @artist = Artist.find_by(id: params[:artist_id])
#       if @artist.nil?
#         flash[:alert] = "Artist not found."
#         redirect_to artists_path
#       else
#         @songs = @artist.songs
#       end
#     end
#     @songs = Song.all
#   end
  def show
    @user = current_user
    @recipe = Recipe.find_by(id: params[:id])
  end

  def search
    ingredient = Ingredient.new

    ingredient.user = current_user
    ingredient.recipe = Recipe.find_by(id: params[:item])
    ingredient.save
    flash[:message] = ingredient.search_recipes(item)
    redirect_to user_path(current_user)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      redirect_to new_recipe_path
    end
  end

  def edit

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
    params.require(:recipe).permit(:title, :category, :ingredients, :directions, :cook_time)
  end

  def find_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end


end