class ReferenceType < ActiveRecord::Base
  set_table_name "ReferenceType"
  set_primary_key :referenceTypeId
  has_many :reference_codes, :foreign_key => "referenceTypeId"
  
  validates_presence_of :typeLabel, :abbreviation
# Doesn't work with PG and mixed case column names (AR issue)
#  validates_uniqueness_of :typeLabel
end
