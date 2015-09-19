FactoryGirl.define do
  # simplest product
  factory :product do
    name "Beer"
    number 12345
    case_size 24
  end

  # crazy beard
  factory :crazy_beard, class: Product do
    name "Crazy Beard Apple Ale"
    number 407148
    case_size 24
  end
end
