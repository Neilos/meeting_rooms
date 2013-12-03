class Calendar < ActiveRecord::Base
  belongs_to :room, :inverse_of => :calendar
  has_many :bookings, :dependent => :destroy, :inverse_of => :calendar
end
