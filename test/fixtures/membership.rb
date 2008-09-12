class Membership < ActiveRecord::Base
  set_table_name "Membership"
  # set_primary_keys *keys - turns on composite key functionality
  set_primary_keys :userId, :groupId
  belongs_to :user, :foreign_key => :userId
	belongs_to :group, :foreign_key => :groupId
	has_many :statuses, :class_name => 'MembershipStatus', :foreign_key => [:userId, :groupId]
end
