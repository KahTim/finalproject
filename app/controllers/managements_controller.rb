# class ManagementsController < ApplicationController
  
#   def edit
# 		id = params[:id]
# 		@mmgmt = Management.find(id)
# 	end

# 	def update
# 		id = params[:id]
# 		@mgmt = Management.find(id)

# 		if @mgmt.update_attributes(management_params)
# 			redirect_to listing_path(@mgmt.id)
# 		else
# 			redirect_to edit_user_listing_path(@mgmt.id)
# 		end

# 	end

# 	def show
# 		id = params[:id]
# 		@mgmt = Management.find(id)
# 	end

# 	private 

# 	def management_params
# 		params.require(:listing).permit(:name, :manager_name, :address, :city, :property_type, :email, :contact_number)
# 	end

#   	t.string :name
#   	t.string :manager_name
#   	t.string :address
#   	t.string :city
#   	t.string :property_type
#   	t.string :email
#   	t.string :contact_number
# end
