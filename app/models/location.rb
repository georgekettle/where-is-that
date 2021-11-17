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

	def json_feature
		loc_hash = self.attributes
    loc_hash[:popup_html] = "<turbo-frame id='popup_location_#{id}' src='/locations/#{id}/popup' loading='lazy' target='_top'>
                              <div class='h-14 w-14 rounded bg-gray-100 flex items-center justify-center'>
																<svg class='h-5 w-5 stroke-current text-gray-900 animate-pulse' width='22px' height='22px' viewBox='0 0 22 22' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>
															    <g id='Page-1' stroke-width='1' fill='none' fill-rule='evenodd'>
														        <g id='Interface,-Essential/stars-light-sparkle-1' transform='translate(-1.000000, -1.000000)'>
													            <g id='Group' transform='translate(-0.005000, -0.005000)'>
												                <polygon stroke='none' id='Path' points='0 0 24.01 0 24.01 24.01 0 24.01'></polygon>
												                <path d='M6.0025,3.00125 C6.0025,5.21130947 4.21089281,7.00291667 2.00083333,7.00291667 C4.21089281,7.00291667 6.0025,8.79452386 6.0025,11.0045833 C6.0025,8.79452386 7.79410719,7.00291667 10.0041667,7.00291667 C7.79410719,7.00291667 6.0025,5.21130947 6.0025,3.00125 Z' id='Path' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round'></path>
												                <path d='M17.0070833,15.00625 C17.0070833,12.2436757 14.7675743,10.0041667 12.005,10.0041667 C14.7675743,10.0041667 17.0070833,7.76465768 17.0070833,5.00208333 C17.0070833,7.76465768 19.2465924,10.0041667 22.0091667,10.0041667 C19.2465924,10.0041667 17.0070833,12.2436757 17.0070833,15.00625 Z' id='Path' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round'></path>
												                <path d='M17.0070833,15.00625 L17.0070833,16.0066667' id='Path' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round'></path>
												                <path d='M17.0070833,5.00208333 L17.0070833,4.00166667' id='Path' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round'></path>
												                <path d='M10.0041667,21.00875 L10.0041667,22.0091667' id='Path' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round'></path>
												                <path d='M10.0041667,14.0058333 L10.0041667,13.0054167' id='Path' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round'></path>
												                <path d='M6.0025,11.0045833 L6.0025,12.005' id='Path' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round'></path>
												                <path d='M6.0025,2.00083333 L6.0025,3.00125' id='Path' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round'></path>
												                <path d='M10.0041667,13.505625 C10.0041667,15.7156845 8.21255947,17.5072917 6.0025,17.5072917 C8.21255947,17.5072917 10.0041667,19.2988989 10.0041667,21.5089583 C10.0041667,19.2988989 11.7957739,17.5072917 14.0058333,17.5072917 C11.7957739,17.5072917 10.0041667,15.7156845 10.0041667,13.505625 Z' id='Path' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round'></path>
													            </g>
														        </g>
															    </g>
																</svg>
															</div>
                            </turbo-frame>"

    feature = {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [longitude, latitude]
      },
      properties: loc_hash
    }
	end
end
