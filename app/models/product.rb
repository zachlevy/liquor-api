class Product < ActiveRecord::Base
  require_relative '../helpers/lcbo_api_helper'
  has_many :inventories

  # check for existing inventory and create if not
  def update_inventory
    response = get_lcbo_api_all "inventories", ["product_id=#{number}"]

    response.each do |inventory|
      store = Store.find_by(number: inventory['store_no'])
      lcbo_updated_on = inventory["updated_on"].to_date
      next if store.nil? and lcbo_updated_on.nil?
      Inventory.new(
        product: self,
        store: store,
        quantity: inventory["quantity"],
        lcbo_updated_on: lcbo_updated_on,
        lcbo_updated_at: Time.parse(inventory["updated_at"]).getutc
      ).save
    end

  end

  # returns the last inventory by day
  def inventory_by_date store, lcbo_updated_on
    Inventory.where(product: self, store: store, lcbo_updated_on: lcbo_updated_on)
  end
end
