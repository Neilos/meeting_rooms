class Room < ActiveRecord::Base
	belongs_to :organization, :inverse_of => :rooms
	belongs_to :location, :inverse_of => :rooms
	has_many :custom_attributes, :dependent => :destroy, :inverse_of => :room
end
