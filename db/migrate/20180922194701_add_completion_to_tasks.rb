class AddCompletionToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :is_complete, :integer
  end
end
