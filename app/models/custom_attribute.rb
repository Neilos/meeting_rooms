class CustomAttribute < ActiveRecord::Base
	belongs_to :room, :inverse_of => :custom_attributes
end
