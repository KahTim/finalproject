class CreateManagements < ActiveRecord::Migration[5.1]
  def change
    create_table :managements do |t|
    		t.string :name
    		t.string :manager_name
    		t.string :address
    		t.string :city
    		t.string :property_type
    		t.string :email
    		t.string :contact_number
    		
      t.timestamps
    end
  end
end
