class AddPointsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :points, :integer
  end
end
