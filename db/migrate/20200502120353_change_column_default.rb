class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :puzzles, :task, :string, default: "タスクが入力されていません"
  end
end
