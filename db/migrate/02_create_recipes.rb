class CreateRecipes < ActiveRecord::Migration[4.2]
  def change
    create_table :recipes do |t|
        t.string :title	
      	t.string :category
        t.string :ingredients
        t.string :directions
      	t.integer :cook_time

      t.timestamps null: false
    end
  end
end