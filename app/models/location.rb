class Location < ApplicationRecord
	include Geocodable
	has_many :pins

	validates :latitude, uniqueness: { scope: :longitude }

	def address_region
		result = ''
		address_info = [self.city, self.state_code, self.country]
		address_info.each_with_index do |info, index|
			if info.present?
				result += info
				result += ", " unless index + 1 == address_info.length
			end
		end
		result
	end
end
