class Student < ActiveRecord::Base
  set_table_name "Student"
  has_many :room_assignments, :foreign_key => :studentId
  has_many :rooms, :through => :room_assignments, :foreign_key => [:buildingCode, :roomNumber]
end
