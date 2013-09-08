# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :permission_set do
    create__organizations false
    create__memberships false
  end
end
