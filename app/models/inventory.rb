class Inventory < ActiveRecord::Base
  belongs_to :product
  belongs_to :store

  validates :product_id, presence: true
  validates :store_id, presence: true
  validates :quantity, presence: true
  validates :lcbo_updated_on, presence: true
end
