class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
    	t.belongs_to :recipe, null: false
    	t.belongs_to :user
      	t.text :content, null: false
      	t.timestamps null: false
    end
  end
end
