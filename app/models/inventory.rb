class Inventory < ActiveRecord::Base
  belongs_to :product
  belongs_to :store

  validates :product_id, presence: true
  validates :store_id, presence: true
  validates :quantity, presence: true
  validates :lcbo_updated_on, presence: true

  after_update :calc_sales

  # gets the last inventory before the current inventory
  # days ago offsets
  def previous days_ago=0
    Inventory.where(product: product, store: store).where("lcbo_updated_on < ?", (lcbo_updated_on - days_ago)).order(lcbo_updated_on: :desc).first
  end

  # calculates sales and shipments
  def calc_sales
    historic = self.previous
    return if historic.nil?
    sales = nil
    shipment = 0 # units, not cases
    while sales.nil? or sales < 0
      sales = historic.quantity - quantity + shipment
      shipment += product.case_size unless sales >= 0
    end
    self.update_attributes(:sales => sales, :shipment => shipment)
  end
end
