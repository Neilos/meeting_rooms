# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do
    sequence :name do |n| "Room #{n}" end
    sequence :price_per_hour do |n| "#{n}.99" end
    sequence :people_capacity do |n| "#{n}" end
    association :location, factory: :location
    organization_id { location.organization.id }

    factory :room_with_calendar do
      after(:create) do |room, evaluator|
        FactoryGirl.create(:calendar, :room => room)
      end
    end
  end
end
