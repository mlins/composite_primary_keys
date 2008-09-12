class Department < ActiveRecord::Base
  set_table_name "Department"
  # set_primary_keys *keys - turns on composite key functionality
  set_primary_keys :departmentId, :locationId
  has_many :employees, :foreign_key => [:departmentId, :locationId]
end
