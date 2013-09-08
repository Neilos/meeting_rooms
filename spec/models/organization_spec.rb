require 'spec_helper'

describe Organization do
  @attributes = {name: "tech-hub"}
	
	@attributes.each do |attribute, value|
		it "should not be valid without #{attribute}" do
			missing_attributes = {name: "tech-hub"}
			missing_attributes.delete(attribute)
			Organization.create(missing_attributes).should_not be_valid
		end
	end

  it "should be valid with all fields completed" do 
  	Organization.create(name: "tech-hub").should be_valid
  end
end
