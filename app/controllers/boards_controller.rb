class BoardsController < ApplicationController
  def show
    @board = Board.friendly.find(params[:id])
  end
end
