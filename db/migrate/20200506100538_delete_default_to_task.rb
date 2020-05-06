class DeleteDefaultToTask < ActiveRecord::Migration[5.2]
  def change
    change_column :puzzles, :task, :string
  end
end
