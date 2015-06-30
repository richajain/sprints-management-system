class RemoveTableProjectEmployee < ActiveRecord::Migration
  def up
     drop_table :Project_employees
  end
  
  def down
     raise ActiveRecord::IrreversibleMigration
  end
end
