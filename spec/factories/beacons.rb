# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beacon do
    uuid ""
    sequence(:major) { |n| if (n <= 4) then 1 else 2 end}
    sequence(:minor) { |n| n % 4}

    factory :beacon_with_item do
      after(:create) do |beacon|
        create(:item, beacon: beacon )
      end
    end

  end
end
