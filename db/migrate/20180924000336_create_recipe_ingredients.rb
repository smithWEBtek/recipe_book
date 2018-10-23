class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
    	t.belongs_to :recipe
    	t.belongs_to :ingredient
      	t.string :amount
      	t.timestamps null: false
    end
  end
end

