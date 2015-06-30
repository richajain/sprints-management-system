class DeleteManagerFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :manager, :string
  end
end
