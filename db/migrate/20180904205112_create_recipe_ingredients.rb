class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
    	t.string :name, null: false
      	t.string :amount, null: false
      	t.belongs_to :recipe, foreign_key: true, null: false
      	t.belongs_to :ingredient, foreign_key: true, null: false
      	t.timestamps null: false

    end
  end
end
