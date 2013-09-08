class Membership < ActiveRecord::Base
	belongs_to :user, :inverse_of => :memberships
	belongs_to :organization, :inverse_of => :memberships
	belongs_to :permission_set, :inverse_of => :memberships
	validates :user_id, :organization_id, :permission_set_id, presence: :true
end
