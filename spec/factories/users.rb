# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:first_name) {|n| "Name#{n}" }
    sequence(:last_name) {|n| "LastName#{n}" }
    sequence(:email) {|n| "user#{n}@testemail.com" }
    #password "12345678"
  end
end