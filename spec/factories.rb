FactoryGirl.define do
  # simplest product
  factory :product do
    name "Sage"
    number 12345
    case_size 12
  end

  # simplest store
  factory :store do
    number 123
  end

  # most basic inventory
  factory :inventory do
    sequence (:lcbo_updated_on) {|n| "2015-01-01".to_date + n}
    quantity 12
    store
    product
  end

end
