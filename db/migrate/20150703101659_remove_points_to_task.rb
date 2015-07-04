class RemovePointsToTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :points, :integer
  end
end
