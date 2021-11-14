module Geocodable
  extend ActiveSupport::Concern

  included do
    geocoded_by :address  do |obj,results|
		  if geo = results.first
		  	obj.name = geo.place_name
		  	obj.address = geo.address
		    obj.latitude = geo.latitude
		    obj.longitude = geo.longitude
		    obj.postal_code = geo.postal_code
		    obj.state = geo.state
		    obj.state_code = geo.state_code
		    obj.country = geo.country
		    obj.country_code = geo.country_code
		    if geo.data && geo.data["context"] && geo.data["context"][1] && geo.data["context"][1]["text"]
		  		locality = geo.data["context"][1]["text"]
		    	obj.city = geo.city || locality
		  	else
		  		obj.city = geo.city
		  	end
		  end
		end
		
		after_validation :geocode, if: :will_save_change_to_address?
  end
end
