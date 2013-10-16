class Room < ActiveRecord::Base
	belongs_to :organization, :inverse_of => :rooms
	belongs_to :location, :inverse_of => :rooms
	has_many :custom_attributes, :dependent => :destroy, :inverse_of => :room
	validates_associated :custom_attributes
	validates :name, :location_id, :organization_id, presence: :true
  validates_uniqueness_of :name, :scope => :location_id

  accepts_nested_attributes_for :custom_attributes
end
