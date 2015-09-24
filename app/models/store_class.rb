class StoreClass < ActiveRecord::Base
  has_many :stores

  validates_uniqueness_of :name
end
