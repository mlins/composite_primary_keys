class Product < ActiveRecord::Base
  set_table_name "Product"
	set_primary_keys :id  # redundant
	has_many :product_tariffs, :foreign_key => :productId
	has_one :product_tariff, :foreign_key => :productId

	has_many :tariffs, :through => :product_tariffs, :foreign_key => [:tariffId, :tariffStartDate]
end
