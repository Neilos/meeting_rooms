require 'spec_helper'

describe Membership do

  @attributes = {user_id: 5, organization_id: 7, permission_set_id: 9}
	@attributes.each do |attribute, value|
		it "should not be valid without #{attribute}" do
			missing_attributes = {user_id: 5, organization_id: 7, permission_set_id: 9}
			missing_attributes.delete(attribute)
			Membership.create(missing_attributes).should_not be_valid
		end
	end

  it "should be valid with all fields completed" do 
  	Membership.create(user_id: 5, organization_id: 7, permission_set_id: 9).should be_valid
  end

end
