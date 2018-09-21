class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show, :edit, :update]

  def index
    @ingredients = Ingredient.all
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
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def search
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient == recipe.ingredient
      return Recipe.all
    end
    
   
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      redirect_to new_ingredient_path
    end
  end

  def edit

  end

  def update
    @ingredient.update(ingredient_params)
    redirect_to ingredient_path(@ingredient)
  end



  private


  def ingredient_params
    params.require(:ingredient).permit(:name, :amount)
  end

  def find_ingredient
    @ingredient = Ingredient.find_by(id: params[:id])
  end


end