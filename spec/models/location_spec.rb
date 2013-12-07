require 'spec_helper'
describe Location do

  let(:attributes) { FactoryGirl.build(:location).attributes }

  @essential_attrs = [ "name", "address_line_1", "address_line_2", "town_city", "county", "postcode", "country", "organization_id" ]
  @essential_attrs.each do |attribute|
    it "should not be valid without #{attribute}" do
      with_missing_attribute = attributes
      with_missing_attribute.delete(attribute)
      Location.create(with_missing_attribute).should_not be_valid
    end
  end

  it "should be valid with all fields completed" do 
  	Location.create(attributes).should be_valid
  end

  it "should have a name that is unique within it's organization" do 
    Location.create(attributes).should be_valid
    Location.create(attributes).should_not be_valid
    Location.create(attributes.merge({organization_id: 2})).should be_valid
  end

end
