class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :role

      t.timestamps null: false
    end
  end
end
