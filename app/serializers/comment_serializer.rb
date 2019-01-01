class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :recipe_id, :content
end
