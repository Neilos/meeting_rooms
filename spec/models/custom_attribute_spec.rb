require 'spec_helper'

describe CustomAttribute do
  
  it "should not be valid without a room_id" do
  	CustomAttribute.create(name: "wifi", value: "yes").should_not be_valid
  end

  it "should not be valid without a name" do
  	CustomAttribute.create(value: "yes", room_id: 1).should_not be_valid
  end

  it "should not be valid without a value" do
  	CustomAttribute.create(name: "wifi", room_id: 1).should_not be_valid
  end

  it "should be valid with all fields completed" do 
  	CustomAttribute.create(name: "wifi", value: "yes", room_id: 1).should be_valid
  end


end
