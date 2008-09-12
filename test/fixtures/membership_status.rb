class MembershipStatus < ActiveRecord::Base
  set_table_name "MembershipStatus"
	belongs_to :membership, :foreign_key => [:userId, :groupId]
end
