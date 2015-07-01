class DeleteTypeFromProject < ActiveRecord::Migration
  def change
	remove_column :projects, :type, :integer
  end
end
