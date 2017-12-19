class ReservationsController < ApplicationController

	def new 
		@reservation = Reservation.new 
		@listing = Listing.find(params[:listing_id])
	end 

	def create 
		@listing = Listing.find(params[:listing_id]) 
		@reservation = current_user.reservations.new(reservation_params)
		@reservation.listing_id = @listing.id
		if @reservation.save
			@reservation.update(listing_id: @listing.id, end_time: @reservation.start_time.to_datetime + @reservation.duration.minutes)
			
			redirect_to root_path
		else 
			render new_listing_reservation_path(@listing.id)
		end 
	end

	private 

	def reservation_params 
		params.require(:reservation).permit(:duration, :user_id, :listing_id, :start_time, :end_time, :guest_number)
	end
end

