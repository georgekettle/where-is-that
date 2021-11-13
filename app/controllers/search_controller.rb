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
      feature = {
        type: "Feature",
        geometry: {
          type: "Point",
          coordinates: [loc.longitude, loc.latitude]
        },
        properties: loc.attributes
      }
    end
  end
end
