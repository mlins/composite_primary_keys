class RoomAttributeAssignment < ActiveRecord::Base
  set_table_name "RoomAttributeAssignment"
  set_primary_keys :dormId, :roomId, :roomAttributeId
  belongs_to :room, :foreign_key => [:dormId, :roomId]
  belongs_to :room_attribute, :foreign_key => :roomAttributeId
end
