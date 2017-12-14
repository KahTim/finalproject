class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
    	t.string :title
    	t.string :address
    	t.string :city
    	t.string :category
    	t.integer :price
        t.string :avatar
    	t.timestamps null:false
    end
  end
end
