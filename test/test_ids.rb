require 'abstract_unit'
require 'fixtures/reference_type'
require 'fixtures/reference_code'

class TestIds < Test::Unit::TestCase
  fixtures :ReferenceType, :ReferenceCode
  
  CLASSES = {
    :single => {
      :class => ReferenceType,
      :primary_keys => [:referenceTypeId],
    },
    :dual   => { 
      :class => ReferenceCode,
      :primary_keys => [:referenceTypeId, :referenceCode],
    },
    :dual_strs   => { 
      :class => ReferenceCode,
      :primary_keys => ['referenceTypeId', 'referenceCode'],
    },
  }
  
  def setup
    self.class.classes = CLASSES
  end
  
  def test_id
    testing_with do
      assert_equal @first.id, @first.ids if composite?
    end
  end
  
  def test_id_to_s
    testing_with do
      assert_equal first_id_str, @first.id.to_s
      assert_equal first_id_str, "#{@first.id}"
    end
  end
  
  def test_ids_to_s
    testing_with do
      order = if @klass.primary_key.is_a?(String)
                ActiveRecord::Base.connection.quote_column_name(@klass.primary_key)
              else  
                @klass.primary_key.map { |k| ActiveRecord::Base.connection.quote_column_name(k) }.join(',')
              end
      to_test = @klass.find(:all, :order => order)[0..1].map(&:id)
      assert_equal '(1,1),(1,2)', @klass.ids_to_s(to_test) if @key_test == :dual
      assert_equal '1,1;1,2', @klass.ids_to_s(to_test, ',', ';', '', '') if @key_test == :dual
    end
  end
  
  def test_composite_where_clause
    testing_with do
      where = '"ReferenceCode"."referenceTypeId"=1 AND "ReferenceCode"."referenceCode"=2) OR ("ReferenceCode"."referenceTypeId"=2 AND "ReferenceCode"."referenceCode"=2'
      assert_equal(where, @klass.composite_where_clause([[1, 2], [2, 2]])) if @key_test == :dual
    end
  end
  
  def test_set_ids_string
    testing_with do
      array = @primary_keys.collect {|key| 5}
      expected = composite? ? array.to_composite_keys : array.first
      @first.id = expected.to_s
      assert_equal expected, @first.id
    end
  end
  
  def test_set_ids_array
    testing_with do
      array = @primary_keys.collect {|key| 5}
      expected = composite? ? array.to_composite_keys : array.first
      @first.id = expected
      assert_equal expected, @first.id
    end
  end
  
  def test_set_ids_comp
    testing_with do
      array = @primary_keys.collect {|key| 5}
      expected = composite? ? array.to_composite_keys : array.first
      @first.id = expected
      assert_equal expected, @first.id
    end
  end
  
  def test_primary_keys
    testing_with do
      if composite?
        assert_not_nil @klass.primary_keys
        assert_equal @primary_keys.map {|key| key.to_sym}, @klass.primary_keys
        assert_equal @klass.primary_keys, @klass.primary_key
      else
        assert_not_nil @klass.primary_key
        assert_equal @primary_keys, [@klass.primary_key.to_sym]
      end
      assert_equal @primary_keys.join(','), @klass.primary_key.to_s
      # Need a :primary_keys should be Array with to_s overridden
    end
  end
end
