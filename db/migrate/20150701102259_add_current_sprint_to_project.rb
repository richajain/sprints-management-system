class AddCurrentSprintToProject < ActiveRecord::Migration
  def change
    add_column :projects, :type, :integer
  end
end
