class Restaurant < ActiveRecord::Base
  set_table_name "Restaurant"
  set_primary_keys :franchiseId, :storeId
  has_and_belongs_to_many :suburbs, 
    :join_table => 'RestaurantSuburb',
    :foreign_key => [:franchiseId, :storeId],  
    :association_foreign_key => [:cityId, :suburbId]
end
