FactoryGirl.define do
  # simplest product
  factory :product do
    name "Sage"
    sequence(:number) { |n| 12345 + n }
    case_size 12
  end

  # simplest store
  factory :store do
    sequence(:number) { |n| 123 + n }
  end

  # most basic inventory
  factory :inventory do
    sequence(:lcbo_updated_on) {|n| "2015-01-01".to_date + n}
    quantity 12
    store
    product
  end

  # most basic store_class
  factory :store_class do
    sequence(:name) { |n| "A#{n}" }
  end

end
