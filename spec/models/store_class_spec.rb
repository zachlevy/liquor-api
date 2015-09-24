require 'rails_helper'

RSpec.describe StoreClass, type: :model do
  it "validates a unique name" do
    expect(create(:store_class, :name => "A")).to be_valid
    expect(build(:store_class, :name => "A")).not_to be_valid
  end
end
