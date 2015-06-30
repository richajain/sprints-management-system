class AddManagerToProject < ActiveRecord::Migration
  def change
    add_column :projects, :manager, :integer
    add_reference :projects, :user, index: true, foreign_key: true
  end
end
