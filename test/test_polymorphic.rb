require 'abstract_unit'
require 'fixtures/comment'
require 'fixtures/user'
require 'fixtures/employee'
require 'fixtures/hack'

class TestPolymorphic < Test::Unit::TestCase
  fixtures :User, :Employee, :Comment, :Hack
  
#  def test_polymorphic_has_many
#    comments = Hack.find('andrew').comments
#    assert_equal 'andrew', comments[0].personId
#  end
  
#  def test_polymorphic_has_one
#    first_comment = Hack.find('andrew').first_comment
#    assert_equal 'andrew', first_comment.personId
#  end
  
#  def test_has_many_through
#    user = User(:santiago)
#    article_names = user.articles.collect { |a| a.name }.sort
#    assert_equal ['Article One', 'Article Two'], article_names
#  end
  
#  def test_polymorphic_has_many_through
#    user = User(:santiago)
#    assert_equal ['andrew'], user.hacks.collect { |a| a.name }.sort
#  end

end
