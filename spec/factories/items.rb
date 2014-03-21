# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    spec { [ 'COUPON', 'PRODUCT', 'HELP', 'SAMPLE', 'POINTS' ].sample }
    sequence(:name) { |n| "Item #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    show_after_seconds { [15, 30, 60].sample }

    factory :item_with_beacon do
      association :beacon, factory: :beacon
    end

  end
end
