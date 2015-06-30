class AddUserProjectsToWork < ActiveRecord::Migration
  def change
    add_reference :works, :users, index: true, foreign_key: true
    add_reference :works, :projects, index: true, foreign_key: true
  end
end
