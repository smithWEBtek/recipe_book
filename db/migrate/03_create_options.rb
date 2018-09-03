class CreateOptions < ActiveRecord::Migration[4.2]
  def change
    create_table :options do |t|
      	t.integer :recipe_id
      	t.integer :user_id

      t.timestamps null: false
    end
  end
end