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
    repeats "repeats"
    repeats_every_n_days 1
    repeats_every_n_weeks 1
    repeats_weekly_each_days_of_the_week_mask 1
    repeats_every_n_months 1
    repeats_monthly "repeats monthly"
    repeats_monthly_each_days_of_the_month_mask 1
    repeats_monthly_on_ordinals_mask 1
    repeats_monthly_on_days_of_the_week_mask 1
    repeats_every_n_years 1
    repeats_yearly_each_months_of_the_year_mask 1
    repeats_yearly_on false
    repeats_yearly_on_ordinals_mask 1
    repeats_yearly_on_days_of_the_week_mask 1
    repeat_ends "repeat ends"
    repeat_ends_on { 1.year.from_now }
    time_zone "MyString"
    association :room, factory: :room
    association :user, factory: :user
  end
end
