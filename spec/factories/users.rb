# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "First#{n}" }
    sequence(:last_name) { |n| "Last#{n}" }
    email { "#{first_name}.#{last_name}@example.com".downcase }

    uid "MyString"
  end
end
