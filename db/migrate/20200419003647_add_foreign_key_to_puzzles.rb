class AddForeignKeyToPuzzles < ActiveRecord::Migration[5.2]
  def change
    add_reference :puzzles, :user, foreign_key: true
  end
end
