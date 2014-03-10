# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beacon do
    uuid "B9407F30-F5F8-466E-AFF9-25556B57FE6D"
    sequence(:major) { |n| n }
    sequence(:minor) { |n| n }
  end
end
