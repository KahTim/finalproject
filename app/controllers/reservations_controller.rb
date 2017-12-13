class ReservationsController < ApplicationController

	def new 
		@reservation = Reservation.new 
		@listing = Listing.find(params[:listing_id])
	end 

	def create 
		@reservation = current_user.reservations.new(reservation_params)
		if @reservation.save 
			redirect_to root_path
		else 
			render new_listing_reservation_path(@listing.id)
	end end

	private 

	def reservation_params 
		params.require(:reservation).permit(:user_id, :listing_id, :start_time, :end_time, :guest_number)
	end
end

