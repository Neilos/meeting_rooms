# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :booking do
    name "MyString"
    description "MyText"
    is_all_day false
    from_date "2013-11-29"
    from_time "2013-11-29 11:17:07"
    to_date "2013-11-29"
    to_time "2013-11-29 11:17:07"
    repeats "MyString"
    repeats_every_n_days 1
    repeats_every_n_weeks 1
    repeats_weekly_each_days_of_the_week_mask 1
    repeats_every_n_months 1
    repeats_monthly "MyString"
    repeats_monthly_each_days_of_the_month_mask 1
    repeats_monthly_on_ordinals_mask 1
    repeats_monthly_on_days_of_the_week_mask 1
    repeats_every_n_years 1
    repeats_yearly_each_months_of_the_year_mask 1
    repeats_yearly_on false
    repeats_yearly_on_ordinals_mask 1
    repeats_yearly_on_days_of_the_week_mask 1
    repeat_ends "MyString"
    repeat_ends_on "2013-11-29"
    time_zone "MyString"
    room_id 1
    user_id 1
  end
end
