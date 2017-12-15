class AddManagementColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :manager_name, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :property_type, :string
    add_column :users, :contact_number, :string
  end
end
