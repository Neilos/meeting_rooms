require 'spec_helper'

describe Room do
  @attributes = {name: "room 10", location_id: 5, organization_id: 9}
	
	@attributes.each do |attribute, value|
		it "should not be valid without #{attribute}" do
			missing_attributes = {name: "room 10", location_id: 5, organization_id: 9}
			missing_attributes.delete(attribute)
			Room.create(missing_attributes).should_not be_valid
		end
	end

  it "should be valid with all fields completed" do 
  	Room.create(name: "room 10", location_id: 5, organization_id: 9).should be_valid
  end

  it "should have a name that is unique at it's location" do
    attributes = {name: "room 10", location_id: 5, organization_id: 9}
    Room.create(attributes).should be_valid
    Room.create(attributes).should_not be_valid
    Room.create(attributes.merge({location_id: 6})).should be_valid
  end

  it "creates its own calendar when first created" do
    room = FactoryGirl.create(:room)
    room.calendar.should_not be_nil
  end
end
