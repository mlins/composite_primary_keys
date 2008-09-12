require 'abstract_unit'
require 'fixtures/reference_type'
require 'fixtures/reference_code'

class TestDummy < Test::Unit::TestCase
  fixtures :ReferenceType, :ReferenceCode
  
  classes = {
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
    self.class.classes = classes
  end
  
  def test_truth
    testing_with do
      assert true
    end
  end
end
