class ReferenceCode < ActiveRecord::Base
  set_table_name "ReferenceCode"
  set_primary_keys :referenceTypeId, :referenceCode
  
  belongs_to :reference_type, :foreign_key => :referenceTypeId
  
  validates_presence_of :referenceCode, :codeLabel, :abbreviation
end
