class PermissionSet < ActiveRecord::Base
	has_many :memberships, :inverse_of => :permission_set
	validates_associated :memberships
end
