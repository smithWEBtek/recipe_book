class CommentSerializer < ActiveModel::Serializer
	attributes :id, :title, :user_id, :recipe_id, :content
	belongs_to :recipe
	belongs_to :user

end
