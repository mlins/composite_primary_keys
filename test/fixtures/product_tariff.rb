class ProductTariff < ActiveRecord::Base
  set_table_name "ProductTariff"
	set_primary_keys :productId, :tariffId, :tariffStartDate
	belongs_to :product, :foreign_key => :productId
	belongs_to :tariff,  :foreign_key => [:tariffId, :tariffStartDate]
end
