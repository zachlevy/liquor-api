require 'rails_helper'

RSpec.describe Store, type: :model do
  it "validates a unique store number" do
    expect(create(:store, :number => 12345)).to be_valid
    expect(build(:store, :number => 12345)).not_to be_valid
  end
end
