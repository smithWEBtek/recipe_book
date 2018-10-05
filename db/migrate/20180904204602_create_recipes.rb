class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :category
      t.string :directions
      t.integer :cook_time
     
      t.datetime :created_at
      t.datetime :updated_at
      t.belongs_to :user, foreign_key: true
      t.timestamps null: false
    end
  end
end

