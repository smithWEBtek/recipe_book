class RecipeSerializer < ActiveModel::Serializer
	attributes :id, :title, :category, :cook_time, :directions, :user_id
	belongs_to :user
	has_many :comments
end
