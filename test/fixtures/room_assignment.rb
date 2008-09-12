class RoomAssignment < ActiveRecord::Base
  set_table_name "RoomAssignment"
  set_primary_key :studentId
  belongs_to :student, :foreign_key => :studentId
  belongs_to :room, :foreign_key => [:dormId, :roomId]
end
