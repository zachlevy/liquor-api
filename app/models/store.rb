class Store < ActiveRecord::Base
  belongs_to :store_class
  acts_as_mappable
end
