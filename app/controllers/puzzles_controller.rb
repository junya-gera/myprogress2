class PuzzlesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
  end

  def create
    @puzzle = Puzzle.new(puzzle_params)
    @puzzle.save
    redirect_to root_path
  end
  
private
  def puzzle_params
    params.require(:puzzle).permit(:task).merge(user_id: current_user.id)
  end
  
end


end
