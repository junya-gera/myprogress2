class RenameTasks < ActiveRecord::Migration[5.2]
  def change
    rename_table :tasks, :events
  end
end
