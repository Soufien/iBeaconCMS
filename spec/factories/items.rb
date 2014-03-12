# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    spec { [ 'TYPE1', 'TYPE2' ].sample }
    sequence(:name) { |n| "Item #{n}" }
    sequence(:description) { |n| "Description #{n}" }

    factory :item_with_beacon do
      after(:build) do |item|
        item.beacon = FactoryGirl.build(:beacon, item: item)
      end
    end

  end
end
