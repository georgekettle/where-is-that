class SavesController < ApplicationController
	def create
		@board = Board.friendly.find(params[:board_id])
		@pin = Pin.find(params[:pin_id])
		@save = Save.new(board: @board, pin: @pin)

		@save.save

		respond_to do |format|
			format.turbo_stream {}
	    format.json 				{ render :json => @save, :include => [:board, :pin], :except => [:board_id, :pin_id] }
	    format.html         { redirect_back(fallback_location: root_path) }
	  end
	end
end
