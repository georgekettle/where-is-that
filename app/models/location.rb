class Location < ApplicationRecord
	has_many :pins

	geocoded_by :address
	reverse_geocoded_by :latitude, :longitude
	after_validation :geocode, :reverse_geocode
end
