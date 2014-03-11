# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    spec { [ 'TYPE1', 'TYPE2' ].sample }
    sequence(:name) { |n| "Item #{n}" }
    sequence(:description) { |n| "Description #{n}" }

    factory :item_not_valid do
      spec 1234 # This is a not valid value
    end
  end
end
