class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.string :category, null: false
      t.string :directions, null: false
      t.integer :cook_time, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
