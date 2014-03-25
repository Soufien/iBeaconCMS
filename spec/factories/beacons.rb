# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beacon do
    uuid ""
    major 1
    sequence(:minor) { |n| n % 4 + 1}

    factory :beacon_with_item do
      after(:create) do |beacon|
        create(:item, beacon: beacon )
      end
    end

  end
end
