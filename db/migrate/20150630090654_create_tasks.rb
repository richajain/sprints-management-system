class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :text
      t.integer :status
      t.integer :sprints
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
