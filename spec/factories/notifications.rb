# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    device_id "MyString"
    os "MyString"
    beacon nil
    content "MyText"
  end
end
