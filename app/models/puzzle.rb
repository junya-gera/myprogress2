class Puzzle < ApplicationRecord
  belongs_to :user

  def self.is_puzzle?
    if @puzzles == nil
      9.times do
        Puzzle.create(user_id: @user.id)
      end
    end
  end

end
