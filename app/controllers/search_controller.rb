class SearchController < ApplicationController
  def search
    if params["location_id"]
       @location = Location.find(params["location_id"])
    end
  end

  def location_search
    ne_corner = params[:bbox].first.reverse
    sw_corner = params[:bbox].second.reverse
    @locations = Location.within_bounding_box(ne_corner, sw_corner)
    render :json => json_locations
  end

  def json_locations
    @locations.map do |loc|
      loc.json_feature
    end
  end
end
