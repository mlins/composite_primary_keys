class Room < ActiveRecord::Base
  set_table_name "Room"
  set_primary_keys :dormId, :roomId
  belongs_to :dorm, :foreign_key => :dormId
  has_many :room_attribute_assignments, :foreign_key =>  [:dormId, :roomId]
  has_many :room_attributes, :through => :room_attribute_assignments
  
  def find_custom_room_attributes
    room_attributes.find(:all, :conditions => ['"RoomAttribute".name != ?', "keg"])
  end
end
