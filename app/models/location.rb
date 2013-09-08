class Location < ActiveRecord::Base
	belongs_to :organization, :inverse_of => :locations
	has_many :rooms, :dependent => :destroy, :inverse_of => :location
end
