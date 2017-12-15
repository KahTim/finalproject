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
		@listing = Listing.find(params[:id])
	end
private
	def params_for_listings
		params.require(:listing).permit(:title,:address,:city,:type,:price)
	end
	def filtering_params(params)
  		params.slice(:city,:category)
	end
end
