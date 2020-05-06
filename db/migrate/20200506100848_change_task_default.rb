class ChangeTaskDefault < ActiveRecord::Migration[5.2]
  def up
    change_column :puzzles, :task, :string
  end

  def down
    change_column :puzzles, :task, :string, default: "タスクが入力されていません"
  end
end
