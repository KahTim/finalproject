class AddGuestNumber < ActiveRecord::Migration[5.1]
  def change
  	add_column :reservations, :guest_number, :integer
  end
end
