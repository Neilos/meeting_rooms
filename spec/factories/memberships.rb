# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :membership do
    user_id 1
    organization_id 1
    permission_set_id 1
  end
end
