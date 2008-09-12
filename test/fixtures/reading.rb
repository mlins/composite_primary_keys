class Reading < ActiveRecord::Base
  set_table_name "Reading"
  belongs_to :article, :foreign_key => :articleId
  belongs_to :user, :foreign_key => :userId
end 
