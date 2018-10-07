class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
    	t.belongs_to :recipe, null: false
      	t.belongs_to :ingredient, null: false
      	t.string :amount, null: false
      	t.timestamps null: false
    end
  end
end

