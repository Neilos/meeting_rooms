require 'spec_helper'
describe Location do

  @attributes = {name: "building", address_line_1: "the street", address_line_2: "more road", town_city: "london", county: "essex", postcode: "RM9 5YT", country: "UK", organization_id: 1}
	
	@attributes.each do |attribute, value|
		it "should not be valid without #{attribute}" do
			missing_attributes = {name: "building", address_line_1: "the street", address_line_2: "more road", town_city: "london", county: "essex", postcode: "RM9 5YT", country: "UK", organization_id: 1}
			missing_attributes.delete(attribute)
			Location.create(missing_attributes).should_not be_valid
		end
	end

  it "should be valid with all fields completed" do 
  	Location.create(name: "building", address_line_1: "the street", address_line_2: "more road", town_city: "london", county: "essex", postcode: "RM9 5YT", country: "UK", organization_id: 1).should be_valid
  end

  it "should have a name that is unique within it's organization" do 
    attributes = {name: "building", address_line_1: "the street", address_line_2: "more road", town_city: "london", county: "essex", postcode: "RM9 5YT", country: "UK", organization_id: 1}
    Location.create(attributes).should be_valid
    Location.create(attributes).should_not be_valid
    Location.create(attributes.merge({organization_id: 2})).should be_valid
  end

end
