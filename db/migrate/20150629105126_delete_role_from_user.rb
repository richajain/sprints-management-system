class DeleteRoleFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :role, :boolean
  end
end
