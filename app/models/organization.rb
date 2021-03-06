class Organization < ActiveRecord::Base
	has_many :memberships, :dependent => :destroy, :inverse_of => :organization
	validates_associated :memberships
	has_many :members, :source => :user, :through => :memberships
	has_many :locations, :dependent => :destroy, :inverse_of => :organization
	validates_associated :locations
	has_many :rooms, :dependent => :destroy, :inverse_of => :organization
	validates_associated :rooms
	validates :name, presence: :true
end
