# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :calendar do
    color "red"
    association :room, factory: :room

    factory :calendar_with_bookings do
      ignore do
        bookings_count 5
      end

      after(:create) do |room, evaluator|
        FactoryGirl.create_list(:book, evaluator.bookings_count, room: room)
      end
    end
  end
end
