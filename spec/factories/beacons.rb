# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beacon do |beacon|
    uuid "B9407F30-F5F8-466E-AFF9-25556B57FE6D"
    major 1
    sequence(:minor) { |n| n }

    factory :beacon_with_items do


      after(:create) do |beacon|
        create(:item, beacon: beacon, show_after_seconds: 15)
        create(:item, beacon: beacon, show_after_seconds: 30)
        create(:item, beacon: beacon, show_after_seconds: 60)
      end
    end

  end
end
