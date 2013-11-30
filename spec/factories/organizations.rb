# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization do
    sequence :name do |n| "Organization #{n}" end

    factory :organization_with_locations do
    	ignore do
    		locations_count 5
    	end

    	after(:create) do |organization, evaluator|
    		FactoryGirl.create_list(:location, evaluator.locations_count, organization: organization)
    	end
    end
  end
end
