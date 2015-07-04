class RemovePointFromTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :point, :integer
  end
end
