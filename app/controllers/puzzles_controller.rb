class PuzzlesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @puzzles = Puzzle.where(user_id: @user)
  end

  def edit
    @user = User.find(params[:user_id])
    @puzzle = Puzzle.find(params[:id])
  end
  
  def create
    @puzzle = Puzzle.create(puzzle_params)
    redirect_to user_puzzles_path(current_user)
  end

  def update
    @puzzle = Puzzle.find(params[:id])
    if @puzzle.update(puzzle_params)
      redirect_to user_puzzles_path(current_user)
    else
      render :edit
    end
  end
  
private
  def puzzle_params
    params.require(:puzzle).permit(:task).merge(user_id: current_user.id)
  end
  
end