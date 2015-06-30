class AddUserProjectsToWork < ActiveRecord::Migration
  def change
    add_reference :works, :user, index: true, foreign_key: true
    add_reference :works, :project, index: true, foreign_key: true
  end
end
