class Dorm < ActiveRecord::Base
  set_table_name "Dorm"
  has_many :rooms, :include => :room_attributes, :foreign_key => :dormId
end
