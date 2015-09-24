require 'rails_helper'

RSpec.describe Product, type: :model do

  it "validates a unique product number" do
    expect(create(:product, :number => 12345)).to be_valid
    expect(build(:product, :number => 12345)).not_to be_valid
  end

  it "validates case size" do
    expect(build(:product, :case_size => nil)).not_to be_valid
  end
end
