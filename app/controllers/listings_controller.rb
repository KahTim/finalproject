class ListingsController < ApplicationController

	def index
		@listings = Listing.all
		filtering_params(params).each do |key, value|
    	@listings = @listings.public_send(key, value) if value.present?
  		end
	end

	def new
		@listing = Listing.new
	end
	
	def create
		@listing = current_user.listings.new(params_for_listings)

		if @listing.save
			redirect_to root_url
		else
			redirect_to new_listing_path
		end

	end
	
	def edit
	end
	
	def update
	end
	
	def destroy
	end
	
	def show
		@listing = Listing.find(params[:id])
		@recommended = Listing.where(category: @listing.category)
		@reservation = Reservation.new
	end

	def management_property
		@listings = current_user.listings
		# byebug
	end

private

	def params_for_listings
		params.require(:listing).permit({avatar: []}, :category, :price, :title, :address, :city)
	end

	def filtering_params(params)
  		params.slice(:city,:category)
	end

end
