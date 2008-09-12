class User < ActiveRecord::Base
  set_table_name "User"
  has_many :readings, :foreign_key => :userId
  has_many :articles, :through => :readings
  has_many :comments, :as => :person
  has_many :hacks, :through => :comments, :source => :hack
  
  def find_custom_articles
    articles.find(:all, :conditions => ["name = ?", "Article One"])
  end
end
