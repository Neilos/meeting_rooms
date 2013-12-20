require 'spec_helper'

describe PermissionSet do

	describe "get_admin_permission_set" do
		admin_permission_set = PermissionSet.get_admin_permission_set
		
		admin_permission_set.attributes.each_pair do |column_name, permission|
			permission.should == true unless ["created_at", "updated_at", "id"].include? column_name
		end
	end

end
