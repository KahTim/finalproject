class ListingsController < ApplicationController
	def index
		@listings = Listing.all
	end

	def new
		@listing = Listing.new
	end
	
	def create
		@listing = Listing.new(params_for_listings)
		if @listing.save
			redirect_to root_path
		else
			render 'new'
		end
	end
	
	def edit
	end
	
	def update
	end
	
	def destroy
	end
	
	def show
	end
private
	def params_for_listings
		params.require(:listing).permit(:title,:address,:city,:type,:price)
	end
end
