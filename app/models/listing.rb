class Listing < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	has_many :users
	has_many :reservations
	
	scope :city, -> (city) { where city: city}
	scope :category, -> (category) { where category: category}
end
