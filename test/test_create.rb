require 'abstract_unit'
require 'fixtures/reference_type'
require 'fixtures/reference_code'
require 'fixtures/street'
require 'fixtures/suburb'

class TestCreate < Test::Unit::TestCase
  fixtures :ReferenceType, :ReferenceCode, :Street, :Suburb
  
  CLASSES = {
    :single => {
      :class => ReferenceType,
      :primary_keys => :referenceTypeId,
      :create => {:referenceTypeId => 10, :typeLabel => 'NEW_TYPE', :abbreviation => 'New Type'}
    },
    :dual   => { 
      :class => ReferenceCode,
      :primary_keys => [:referenceTypeId, :referenceCode],
      :create => {:referenceTypeId => 1, :referenceCode => 20, :codeLabel => 'NEW_CODE', :abbreviation => 'New Code'}
    },
  }
  
  def setup
    self.class.classes = CLASSES
  end
  
  def test_setup
    testing_with do
      assert_not_nil @klass_info[:create]
    end
  end
  
  def test_create
    testing_with do
      assert new_obj = @klass.create(@klass_info[:create])
      assert !new_obj.new_record?
    end
  end
  
  def test_create_no_id
    testing_with do
      begin
        @obj = @klass.create(@klass_info[:create].block(@klass.primary_key))
        @successful = !composite?
      rescue CompositePrimaryKeys::ActiveRecord::CompositeKeyError
        @successful = false
      rescue
        flunk "Incorrect exception raised: #{$!}, #{$!.class}"
      end
      assert_equal composite?, !@successful, "Create should have failed for composites; #{@obj.inspect}"
    end
  end
  
  def test_create_on_association
    suburb = Suburb.find(:first)
    suburb.streets.create(:name => "my street")
    street = Street.find_by_name('my street')
    assert_equal(suburb.cityId, street.cityId)
    assert_equal(suburb.suburbId, street.suburbId)
  end
  
  def test_create_on_association_when_belongs_to_is_single_key
    rt = ReferenceType.find(:first)
    rt.reference_codes.create(:referenceCode => 4321, :codeLabel => 'foo', :abbreviation => 'bar')
    rc = ReferenceCode.find_by_referenceCode(4321)
    assert_equal(rc.referenceTypeId, rt.referenceTypeId)
  end
end
