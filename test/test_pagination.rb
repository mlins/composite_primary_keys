require 'abstract_unit'
require 'fixtures/reference_type'
require 'fixtures/reference_code'
require 'plugins/pagination'

class TestPagination < Test::Unit::TestCase
  fixtures :ReferenceType, :ReferenceCode
  
  include ActionController::Pagination
  DEFAULT_PAGE_SIZE = 2
  
  attr_accessor :params
   
  CLASSES = {
    :single => {
      :class => ReferenceType,
      :primary_keys => :referenceTypeId,
      :table => :ReferenceType,
    },
    :dual   => { 
      :class => ReferenceCode,
      :primary_keys => [:referenceTypeId, :referenceCode],
      :table => :ReferenceCode,
    },
  }
  
  def setup
    self.class.classes = CLASSES
    @params = {}
  end

  def test_paginate_all
    testing_with do
      @object_pages, @objects = paginate @klass_info[:table], :per_page => DEFAULT_PAGE_SIZE
      assert_equal 2, @objects.length, "Each page should have #{DEFAULT_PAGE_SIZE} items"
    end
  end
end
