# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :booking do
    sequence :name do |n| "Booking #{n}" end
    sequence :description do |n| "Description of booking #{n}" end
    is_all_day false
    sequence :from_date do |n| (n + 1).days.ago end
    sequence :from_time do |n| (n + 1).days.ago end
    sequence :to_date do |n| (n).days.ago end
    sequence :to_time do |n| (n).days.ago end
    repeats 'never'
    time_zone "London"
    association :room, factory: :room
    association :booker, factory: :user
  end
end
