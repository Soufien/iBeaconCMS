# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beacon do |beacon|
    uuid "B9407F30-F5F8-466E-AFF9-25556B57FE6D"
    major 1
    sequence(:minor) { |n| n }

    factory :beacon_with_item do
      after(:build) do |beacon|
        beacon.item = FactoryGirl.build(:item, beacon: beacon)
      end
    end

  end
end
