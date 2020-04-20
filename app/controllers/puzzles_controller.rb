class PuzzlesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
  end

  def create
    @puzzle = Puzzle.create(puzzle_params)
    redirect_to user_puzzles_path(current_user)
  end
  
private
  def puzzle_params
    params.permit(:task).merge(user_id: current_user.id)
  end
  
end