class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
    	t.string :title
    	t.string :address
    	t.string :city
    	t.string :type
    	t.string :price
        t.string :image
    	t.timestamps null:false
    end
  end
end
