class SearchController < ApplicationController
  def search
  end

  def location_search
    ne_corner = params[:bbox].first.reverse
    sw_corner = params[:bbox].second.reverse
    @locations = Location.within_bounding_box(ne_corner, sw_corner)
    render :json => json_locations
  end

  def json_locations
    @locations.map do |loc|
      loc_hash = loc.attributes
      loc_hash[:popup_html] = "<turbo-frame id='messages' src='/messages' loading='lazy'>
                                Loading...
                              </turbo-frame>"

      feature = {
        type: "Feature",
        geometry: {
          type: "Point",
          coordinates: [loc.longitude, loc.latitude]
        },
        properties: loc_hash
      }
    end
  end
end
