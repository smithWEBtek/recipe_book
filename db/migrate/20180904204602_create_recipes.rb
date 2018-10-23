class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :category
      t.text :directions
      t.integer :cook_time
     
      t.datetime :created_at, null: false
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end

