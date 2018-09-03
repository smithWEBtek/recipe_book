class CreateIngredientsList < ActiveRecord::Migration[4.2]
  def change
    create_table :ingredients do |t|
    	t.string :main_ingredient
    	t.string :other_ingredients
      	t.integer :recipe_id
      	t.integer :user_id

      t.timestamps null: false
    end
  end
end