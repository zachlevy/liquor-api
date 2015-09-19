class Product < ActiveRecord::Base
  require_relative '../helpers/lcbo_api_helper'
  has_many :inventories

  validates :number, presence: true
  validates :case_size, presence: true

  # check for existing inventory and create if not
  def update_inventory
    response = LcboApiHelper.get_all "inventories", ["product_id=#{number}", "where_not=is_dead"]

    response.each do |inventory|
      lcbo_updated_on = inventory["updated_on"].to_date
      next if Inventory.exists?(lcbo_updated_on: lcbo_updated_on, store_id: inventory['store_id'], product: self)
      Inventory.create(
        product: self,
        store_id: inventory['store_id'],
        quantity: inventory["quantity"],
        lcbo_updated_on: lcbo_updated_on,
        lcbo_updated_at: Time.parse(inventory["updated_at"]).getutc
      )
    end
  end
end
