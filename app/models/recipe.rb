class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	validates :title, uniqueness: true
	validates :title, presence: true
	
	accepts_nested_attributes_for :ingredients, reject_if: lambda {|attributes| attributes['name'].blank?}
  accepts_nested_attributes_for :recipe_ingredients, reject_if: lambda {|attributes| attributes['name'].blank?}

	def self.valid_entry(params)
		return !params[:recipe][:title].empty? && !params[:recipe][:category].empty? && !params[:recipe][:directions].empty? && !params[:recipe][:cook_time].empty? 

	end	 


  def add_ingredients(params)
    
    params[:recipe_ingredients_attributes].each do |k, recipe_ingredient|

      if !recipe_ingredient[:ingredient][:name].empty?
        ingredient_name = recipe_ingredient[:ingredient][:name].downcase
        ingredient = Ingredient.find_or_create_by(name: ingredient_name)
      elsif !recipe_ingredient[:ingredient_id].empty?
        ingredient = Ingredient.find_by(id: recipe_ingredient[:ingredient_id])
      end

      if !recipe_ingredient[:amount].empty?
        RecipeIngredient.create(amount: recipe_ingredient[:amount], ingredient_id: ingredient.id, recipe_id: self.id )
      end

    end

  end
end
