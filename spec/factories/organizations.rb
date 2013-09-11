# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization do
    name "TechHub"

    factory :organization_with_locations do
    	ignore do
    		locations_count 5
    	end

    	after(:create) do |organization, evaluator|
    		FactoryGirl.create_list(:organization, evaluator.locations_count, organization: organization)
    	end
    end
  end
end
