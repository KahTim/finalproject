class Listing < ApplicationRecord
	mount_uploaders :avatar, AvatarUploader
	serialize :avatars, JSON
	belongs_to :user
	has_many :reservations, dependent: :destroy
	
	scope :city, -> (city) { where city: city}
	scope :category, -> (category) { where category: category}
end
