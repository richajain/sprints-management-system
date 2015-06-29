class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :text
      t.date :start_date
      t.date :finish_date
      t.string :manager

      t.timestamps null: false
    end
  end
end
