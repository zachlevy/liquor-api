class Product < ActiveRecord::Base
  require_relative '../helpers/lcbo_api_helper'
  require_relative '../helpers/application_helper'
  has_many :inventories
  has_many :stores, through: :inventories
  has_many :interactions

  validates_uniqueness_of :number
  validates :case_size, presence: true

  # check for existing inventory and create if not
  def update_inventory
    response = LcboApiHelper.get_all "inventories", ["product_id=#{number}", "where_not=is_dead"]

    response.each do |inventory|
      lcbo_updated_on = inventory["updated_on"].to_date
      next if Inventory.exists?(lcbo_updated_on: lcbo_updated_on, store_id: inventory['store_id'], product: self)
      i = Inventory.new(
        product: self,
        store_id: inventory['store_id'],
        quantity: inventory["quantity"],
        lcbo_updated_on: lcbo_updated_on,
        lcbo_updated_at: Time.parse(inventory["updated_at"]).getutc
      )
      i.save if i.valid?
    end
  end

  # returns sales, shipments
  # day, month, year strings
  # territory object
  def periodic_inventory period, store=nil
    # get sales, conditional filter for store
    inventories = Inventory.where(product: self)
    inventories = inventories.where(store: store) unless store.nil?

    # conditional filters based on day, week, month
    case period
    when "day"
      sales = inventories.group_by_day(:lcbo_updated_on).sum(:sales)
      shipments = inventories.group_by_day(:lcbo_updated_on).sum(:shipment)
    when "week"
      sales = inventories.group_by_week(:lcbo_updated_on).sum(:sales)
      shipments = inventories.group_by_week(:lcbo_updated_on).sum(:shipment)
    when "month"
      sales = inventories.group_by_month(:lcbo_updated_on).sum(:sales)
      shipments = inventories.group_by_month(:lcbo_updated_on).sum(:shipment)
    end

    # helper function to merge sales, shipments in to weeks
    ApplicationHelper.merge_group_stats(
      sales,
      shipments
    )
  end
end
