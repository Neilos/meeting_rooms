class Room < ActiveRecord::Base
	belongs_to :organization, :inverse_of => :rooms
	belongs_to :location, :inverse_of => :rooms
	has_many :custom_attributes, :dependent => :destroy, :inverse_of => :room, :autosave => true
  has_one :calendar, :dependent => :destroy, :inverse_of => :room, :autosave => true
  has_many :bookings, :through => :calendar

  validates_associated :custom_attributes
  validates_associated :calendar
  validates :name, :location_id, :organization_id, presence: :true
  validates_uniqueness_of :name, :scope => :location_id

  accepts_nested_attributes_for :custom_attributes
  accepts_nested_attributes_for :calendar
end
