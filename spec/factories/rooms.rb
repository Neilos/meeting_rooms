# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do
    sequence :name do |n| "Room #{n}" end
    sequence :price_per_hour do |n| "#{n}.99" end
    sequence :people_capacity do |n| "#{n}" end
    association :location, factory: :location
    organization_id { location.organization.id }
  end

  factory :room_with_bookings do
    ignore do
      bookings_count 5
    end

    after(:create) do |room, evaluator|
      FactoryGirl.create_list(:book, evaluator.bookings_count, room: room)
    end
  end
end
