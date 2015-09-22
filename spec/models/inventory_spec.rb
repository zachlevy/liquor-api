require 'rails_helper'

RSpec.describe Inventory, type: :model do
  it "builds basic inventory" do
    expect(build(:inventory)).to be_valid
  end

  it "doesn't build inventories missing a store" do
    expect(build(:inventory, :store => nil)).not_to be_valid
  end

  it "doesn't build inventories missing a product" do
    expect(build(:inventory, :product => nil)).not_to be_valid
  end

  it "calculates all sales and shipments" do
    store = create(:store)
    product = create(:product)

    inv_one = create(:inventory, :store => store, :product => product, :quantity => 12, :lcbo_updated_on => "2015-03-23")
    inv_two = create(:inventory, :store => store, :product => product, :quantity => 18, :lcbo_updated_on => "2015-03-24")
    inv_three = create(:inventory, :store => store, :product => product, :quantity => 18, :lcbo_updated_on => "2015-03-25")
    inv_four = create(:inventory, :store => store, :product => product, :quantity => 30, :lcbo_updated_on => "2015-03-26")
    inv_five = create(:inventory, :store => store, :product => product, :quantity => 28, :lcbo_updated_on => "2015-03-27")
    inv_six = create(:inventory, :store => store, :product => product, :quantity => 32, :lcbo_updated_on => "2015-03-29")

    expect(inv_one.sales).to eq(nil)
    expect(inv_one.shipment).to eq(nil)

    expect(inv_two.sales).to eq(6)
    expect(inv_two.shipment).to eq(12)

    expect(inv_three.sales).to eq(0)
    expect(inv_three.shipment).to eq(0)

    expect(inv_four.sales).to eq(0)
    expect(inv_four.shipment).to eq(12)

    expect(inv_five.sales).to eq(2)
    expect(inv_five.shipment).to eq(0)

    expect(inv_six.sales).to eq(8)
    expect(inv_six.shipment).to eq(12)

  end
end
