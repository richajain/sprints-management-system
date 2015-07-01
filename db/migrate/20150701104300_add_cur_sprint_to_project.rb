class AddCurSprintToProject < ActiveRecord::Migration
  def change
    add_column :projects, :current_sprint, :integer
  end
end
