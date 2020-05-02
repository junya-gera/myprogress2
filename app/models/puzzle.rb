class Puzzle < ApplicationRecord
  belongs_to :user

  def is_puzzle?
  end
end
