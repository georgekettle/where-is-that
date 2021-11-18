class SavesController < ApplicationController
	def create
		@board = Board.friendly.find(params[:board_id])
		@pin = Pin.find(params[:pin_id])
		@save = Save.new(board: @board, pin: @pin)
		@save.save
	end
end
