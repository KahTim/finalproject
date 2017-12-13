class ReservationController < ApplicationController

	def new 
		@reservation = Reservations.new 
	end 

	def create 
		@reservation = current
	end 

	private 

	def reservation_params 
		params.require(:reservation).permit(:user_id, :listing_id, :start_time, :end_time)
end
