module CommentsHelper
  def recipe_id_field(comment)
    if comment.recipe.nil?
    	binding.pry
      select_tag "comment[recipe_id]", options_from_collection_for_select(Recipe.all, :id, :title)
    else
      hidden_field_tag "comment[recipe_id]", comment.recipe_id
    end
  end
end