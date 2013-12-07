# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :permission_set do
    sequence :create__organizations do |n| (n % 2) == 0 end
    sequence :create__memberships do |n| (n % 4) == 0 end

    initialize_with {
      PermissionSet.where(
        create__organizations: create__organizations,
        create__memberships: create__memberships
      ).first_or_create
    }
  end
end
