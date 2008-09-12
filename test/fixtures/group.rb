class Group < ActiveRecord::Base
  set_table_name "Group"
  has_many :memberships
end
