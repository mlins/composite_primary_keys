class Street < ActiveRecord::Base
  set_table_name "Street"
  belongs_to :suburb, :foreign_key => [:cityId, :suburbId]
end
