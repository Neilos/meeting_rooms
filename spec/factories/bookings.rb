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
    time_zone "UTC"
    association :calendar, factory: :calendar
    association :booker, factory: :user
    repeat_ends 'never'

    factory :booking_repeats_every_3_days do
      repeats "daily"
      repeats_every_n_days 3
    end

    factory :booking_repeats_every_2_weeks_on_sun_and_thu do
      repeats "weekly"
      repeats_every_n_weeks 2
      repeats_weekly_each_days_of_the_week %w[sunday thursday]
    end

    factory :booking_repeats_every_2_months_on_the_1st_2nd_and_10th do
      repeats "monthly"
      repeats_every_n_months 2
      repeats_monthly 'each'
      repeats_monthly_each_days_of_the_month [1, 2, 10]
    end

    factory :booking_repeats_every_3_months_on_first_and_last_mon_and_sat do
      repeats "monthly"
      repeats_every_n_months 3
      repeats_monthly 'on'
      repeats_monthly_on_ordinals [1, -1]
      repeats_monthly_on_days_of_the_week %w[monday saturday]
    end

    factory :booking_repeats_every_year_on_2nd_and_3rd_tues_and_fri_of_feb_and_nov do
      repeats "yearly"
      repeats_every_n_years 1
      repeats_yearly_on true
      repeats_yearly_on_ordinals [2,3]
      repeats_yearly_on_days_of_the_week %w[tuesday friday]
      repeats_yearly_each_months_of_the_year %w[february november]
    end

    factory :booking_repeats_every_2_years_on_booking_date_in_mar_and_aug do
      repeats "yearly"
      repeats_every_n_years 2
      repeats_yearly_on false
      repeats_yearly_each_months_of_the_year %w[march august]
    end

    trait :ends_in_20_days do
      repeat_ends 'on'
      repeat_ends_on (Time.now + 20.days).beginning_of_day
    end

    trait :ends_in_20_weeks do
      repeat_ends 'on'
      repeat_ends_on (Time.now + 20.weeks).beginning_of_day
    end

    trait :ends_in_20_months do
      repeat_ends 'on'
      repeat_ends_on (Time.now + 20.months).beginning_of_day
    end

    trait :ends_in_20_months do
      repeat_ends 'on'
      repeat_ends_on (Time.now + 20.months).beginning_of_day
    end

    trait :ends_in_20_years do
      repeat_ends 'on'
      repeat_ends_on (Time.now + 20.years).beginning_of_day
    end
  end
end
