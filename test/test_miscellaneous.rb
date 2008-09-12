require 'abstract_unit'
require 'fixtures/reference_type'
require 'fixtures/reference_code'

class TestMiscellaneous < Test::Unit::TestCase
  fixtures :ReferenceType, :ReferenceCode, :Product
  
  CLASSES = {
    :single => {
      :class => ReferenceType,
      :primary_keys => :referenceTypeId,
    },
    :dual   => { 
      :class => ReferenceCode,
      :primary_keys => [:referenceTypeId, :referenceCode],
    },
  }
  
  def setup
    self.class.classes = CLASSES
  end

  def test_composite_class
    testing_with do
      assert_equal composite?, @klass.composite?
    end
  end

  def test_composite_instance
    testing_with do
      assert_equal composite?, @first.composite?
    end
  end
  
  def test_count
    assert_equal 2, Product.count
  end
  
end
