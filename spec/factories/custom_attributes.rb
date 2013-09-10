# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :custom_attribute do
    name "Dimensions"
    value "24' x 20' x 10'"
    room_id 1
  end
end
