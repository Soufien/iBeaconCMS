# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :detection do
    association :beacon, factory: :beacon_with_item
    association :user, factory: :user
    proximity { Random.new.rand(0..3) }
    accuracy { proximity * 0.1111 }
    rssi { proximity * 25}
  end
end
