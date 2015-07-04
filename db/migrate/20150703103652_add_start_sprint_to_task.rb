class AddStartSprintToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :start_sprint, :integer
  end
end
