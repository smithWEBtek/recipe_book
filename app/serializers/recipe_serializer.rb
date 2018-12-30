class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :category, :cook_time, :directions
  belongs_to :user
end
