class Organization < ActiveRecord::Base
	has_many :memberships, :dependent => :destroy, :inverse_of => :organization
	has_many :staff, :source => :user, :through => :memberships
end
