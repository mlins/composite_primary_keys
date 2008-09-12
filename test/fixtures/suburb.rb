class Suburb < ActiveRecord::Base
  set_table_name "Suburb"
  set_primary_keys :cityId, :suburbId
  has_many :streets,  :foreign_key => [:cityId, :suburbId]
  has_many :first_streets,  :foreign_key => [:cityId, :suburbId], 
          :class_name => 'Street', :conditions => '"Street".name = ' "'First Street'"
end
