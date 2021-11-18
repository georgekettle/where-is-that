class BoardsController < ApplicationController
  def show
    @board = Board.friendly.find(params[:id])
    @json_locations = @board.locations.map{ |loc| loc.json_feature }.to_json
  end
end
