class AddTaskColumnToPuzzles < ActiveRecord::Migration[5.2]
  def change
    add_column :puzzles, :task, :string
  end
end
