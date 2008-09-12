class Article < ActiveRecord::Base
  set_table_name "Article"
  has_many :readings, :foreign_key => :userId
  has_many :users, :through => :readings
end

