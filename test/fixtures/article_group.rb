class ArticleGroup < ActiveRecord::Base
  set_table_name "ArticleGroup"
  belongs_to :article, :foreign_key => :articleId
  belongs_to :group, :foreign_key => :groupId
end
