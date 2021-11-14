class Location < ApplicationRecord
	include Geocodable
	has_many :pins

	validates :latitude, uniqueness: { scope: :longitude }
end
