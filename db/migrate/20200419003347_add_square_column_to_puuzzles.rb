class AddSquareColumnToPuuzzles < ActiveRecord::Migration[5.2]
  def change
    add_column :puzzles, :square, :boolean, default: false, null: false
  end
end
