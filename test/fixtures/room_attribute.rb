class RoomAttribute < ActiveRecord::Base
  set_table_name "RoomAttribute"
  has_many :rooms, :through => :room_attribute_assignments
end
