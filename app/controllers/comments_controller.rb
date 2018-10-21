class CommentsController < ApplicationController
  def index
    if params[:recipe_id]
      @comments = Recipe.find(params[:recipe_id]).comments
    else
      @comments  = Comment.all
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end
    
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build
  end
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to recipe_url(@comment.recipe_id)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to recipe_url(@comment.recipe_id)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to recipe_url(@comment.recipe_id)
  end
end
