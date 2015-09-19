class Store < ActiveRecord::Base
  require_relative '../helpers/lcbo_api_helper'
  belongs_to :store_class
  has_many :inventories
  acts_as_mappable

  # check for existing store and create if not
  def self.refresh_all
    response = get_lcbo_api_all "stores"
    response.each do |store|
      s = Store.create_with(
        name: store["name"].to_s,
        address: store["address_line_1"].to_s + ", " + store["address_line_2"].to_s,
        city: store["city"].to_s,
        province: "ON",
        postal_code: store["postal_code"].to_s,
        phone: store["telephone"].to_s,
        fax: store['telephone'],
        dead: store["is_dead"],
        lat: store["latitude"],
        lng: store["longitude"],
        lcbo_updated_at: Time.parse(store["updated_at"]).getutc
      ).find_or_create_by(number: store["store_no"].to_i)
    end
  end
end
