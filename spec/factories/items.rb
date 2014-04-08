# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    sequence(:spec)  {|n| [ 'SAMPLE', 'PRODUCT', 'HELP', 'POINTS', 'KIOSK', 'KIOSK' ][n - 1] }
    sequence(:name) { |n| "Item #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    content 'html'
    goodbye_content 'goodbye content'
    show_after_seconds 5


    factory :item_with_beacon do
      association :beacon, factory: :beacon
    end

  end
end
