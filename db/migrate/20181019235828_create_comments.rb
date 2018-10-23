class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
    	t.belongs_to :recipe
    	t.string :title
      	t.text :content
      	t.timestamps null: false
    end
  end
end
