class Puzzle < ApplicationRecord
  belongs_to :user

  def is_puzzle?
    if @puzzles == nil
      9.times do 
        Puzzle.new
      end
    end
  end

end
