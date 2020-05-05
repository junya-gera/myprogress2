class PuzzlesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if user_signed_in?
      @puzzles = Puzzle.where(user_id: current_user)

      if @puzzles == []
        9.times do
          Puzzle.create(user_id: @user.id)
        end
      end
      # @puzzle = @puzzles.first
    end
  end

  def edit
    @puzzles = Puzzle.where(user_id: current_user)
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
      render :index
    end
  end
  
private
  def puzzle_params
    params.permit(:task).merge(user_id: current_user.id)
  end
  
end