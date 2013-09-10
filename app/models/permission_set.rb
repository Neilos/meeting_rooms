class PermissionSet < ActiveRecord::Base
	has_many :memberships, :inverse_of => :permission_set
	validates_associated :memberships

	def self.get_admin_permission_set
		PermissionSet.new(:create__organizations => true, :create__memberships => true)
	end
end
