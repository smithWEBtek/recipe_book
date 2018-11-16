class CommentsController < ApplicationController

  def show
    if params[:recipe_id]
      @comment = Recipe.find(params[:recipe_id]).comments.find(params[:id])
    else
      @comment = find_by_id(Comment)
    end
  end

  def new
    if params[:recipe_id] && !Recipe.exists?(params[:recipe_id])
      redirect_to recipes_path, alert: "Recipe not found."
    else
      @comment = Comment.new(recipe_id: params[:recipe_id])
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to recipe_path(@comment.recipe.id, @comment)
    else
      render :_form_errors
    end
  end


  def update
    @comment = find_by_id(Comment)
    @comment.update(comment_params)
    redirect_to recipe_path(@comment.recipe)
  end

  def edit
    @recipe = find_by_id(Recipe)
    @comment = find_by_id(Comment)
    if session[:user_id] != @comment.user_id 
      redirect_to recipe_path, alert: "Not your comment to edit."
    else
      @comment = find_by_id(Comment)
    end
  end

  def destroy
    @recipe = find_by_id(Recipe)
    @comment = find_by_id(Comment)
    if session[:user_id] != @comment.user_id 
      redirect_to recipe_path, alert: "Not your comment to delete."
    else
      @comment = find_by_id(Comment)
      @comment.destroy!
      redirect_to recipes_path
    end
  end



  private

  def comment_params
    params.require(:comment).permit(:title, :content, :recipe_id)
  end
end
