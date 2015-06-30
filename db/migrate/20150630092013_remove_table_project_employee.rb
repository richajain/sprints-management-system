class RemoveTableProjectEmployee < ActiveRecord::Migration
  def up
    if ActiveRecord::Base.connection.table_exists? 'Project_employees'
      drop_table :Project_employees
    end
  end
end
