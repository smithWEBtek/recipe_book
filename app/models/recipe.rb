class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	validates :title, uniqueness: true
	validates :title, presence: true
	
	accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :recipe_ingredients, reject_if: :all_blank, allow_destroy: true

  scope :search, -> {where(ingredient_name: 'search')} 

	def self.valid_entry(params)
		return !params[:recipe][:title].empty? && !params[:recipe][:category].empty? && !params[:recipe][:directions].empty? && !params[:recipe][:cook_time].empty? 

	end	

  def self.newest(number = all.size)
    order("ID DESC").limit(number)
  end

 def self.search(search)
      @recipes ||= []
      if !Ingredient.find_by(name: search)
        Recipe.none
      elsif
        ingredient = Ingredient.find_by(name: search)
        ingredient_id = RecipeIngredient.find_by(id: ingredient)
        @recipes = Recipe.where(id: ingredient_id.recipe.id)
          @recipes.each do |recipe|
            recipe
          end  
      end
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
