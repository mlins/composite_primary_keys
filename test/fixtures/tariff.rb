class Tariff < ActiveRecord::Base
  set_table_name "Tariff"
	set_primary_keys [:tariffId, :startDate]
	has_many :product_tariffs, :foreign_key => [:tariffId, :tariffStartDate]
	has_one :product_tariff, :foreign_key => [:tariffId, :tariffStartDate]
	has_many :products, :through => :product_tariffs, :foreign_key => [:tariffId, :tariffStartDate]
end
