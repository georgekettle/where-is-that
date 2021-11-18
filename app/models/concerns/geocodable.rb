module Geocodable
  extend ActiveSupport::Concern

  included do
    geocoded_by :address  do |obj,results|
		  if geo = results.first
		  	obj.mapbox_id = geo.data['id']
		  	obj.mapbox_data = geo.data
		  	obj.name = geo.place_name
		  	obj.address = geo.address
		    obj.latitude = geo.latitude
		    obj.longitude = geo.longitude
		    obj.postal_code = geo.postal_code
		    obj.state = geo.state
		    obj.state_code = geo.state_code
		    obj.country = geo.country
		    obj.country_code = geo.country_code
		    obj.city = geo.city
		  end
		end
		
		after_validation :geocode, if: :will_save_change_to_address?
  end
end
