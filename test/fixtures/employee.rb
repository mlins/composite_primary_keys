class Employee < ActiveRecord::Base
  set_table_name "Employee"
	belongs_to :department, :foreign_key => [:departmentId, :locationId]
	has_many :comments, :as => :person
end
