require 'abstract_unit'
require 'fixtures/kitchen_sink'
require 'fixtures/reference_type'

class TestAttributeMethods < Test::Unit::TestCase
  fixtures :KitchenSink, :ReferenceType
  
  def test_read_attribute_with_single_key
    rt = ReferenceType.find(1)
    assert_equal(1, rt.referenceTypeId)
    assert_equal('NAME_PREFIX', rt.typeLabel)
    assert_equal('Name Prefix', rt.abbreviation)
  end

  def test_read_attribute_with_composite_keys
    sink = KitchenSink.find(1,2)
    assert_equal(1, sink.id1)
    assert_equal(2, sink.id2)
    assert_equal(Date.today, sink.aDate)
    assert_equal('string', sink.aString)
  end
end
