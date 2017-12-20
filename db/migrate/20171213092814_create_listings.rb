class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
    	t.string :title
    	t.string :address
    	t.string :city
    	t.string :category
    	t.integer :price
        t.json :avatar
        t.references :user, foreign_key: true
    	t.timestamps null:false
    end
  end
end
