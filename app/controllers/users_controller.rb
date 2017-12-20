require 'byebug'

class UsersController < Clearance::UsersController
	
	def edit
		@user = User.find(current_user.id)
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in(@user)
			redirect_to home_index_path
		else
			redirect_to sign_up_path
		end
	end

	def update
		@user = User.find(current_user.id)
		if @user.update_attributes(user_params)
			redirect_to home_index_path
		else
			redirect_to edit_user_path(current_user.id)
		end
	end

	def show
		if current_user.customer?
			@reservation = Reservation.where(user_id: current_user.id) 
		else
			# @listings = Listing.where(user_id: current_user.id)
			@listings = current_user.listings
			@reservation = []
				@listings.each do |t|
					if Reservation.find_by(listing_id: t.id)
					@reservation << Reservation.where(listing_id: t.id)
					end
				end
		end
	end 

	private 

	def user_params
		if current_user == nil
			params.require(:user).permit(:name, :email, :password, :avatar)
		elsif current_user.customer?  
			params.require(:user).permit(:name, :email, :password, :avatar)
		else
		 if params[:password]
		 	params.require(:user).permit(:name, :email, :password, :avatar, :manager_name, :property_type, :contact_number, :address, :city)
		 else
		 	params.require(:user).permit(:name, :email, :avatar, :manager_name, :property_type, :contact_number, :address, :city)
		 end
		end 
	end

	# def management_params
	# 	if params[:password]
	# 		params.require(:user).permit(:name, :email, :password, :avatar, :manager_name, :property_type, :contact_number, :address, :city)
	# 	else
	# 		params.require(:user).permit(:name, :email, :avatar, :manager_name, :property_type, :contact_number, :address, :city)
	# 	end
	# 	# params.delete(:password) unless management_params[:password].present?
	# end

end
