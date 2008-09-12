class Comment < ActiveRecord::Base
  set_table_name "Comment"
  set_primary_keys :id
  belongs_to :person, :polymorphic => true
  belongs_to :hack, :foreign_key => :hackId
end

