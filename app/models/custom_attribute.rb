class CustomAttribute < ActiveRecord::Base
	belongs_to :room, :inverse_of => :custom_attributes
	validates :room_id, :value, :name, presence: :true
end
