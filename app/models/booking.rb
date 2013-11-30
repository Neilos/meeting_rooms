class Booking < ActiveRecord::Base
  belongs_to :room, :inverse_of => :bookings
  belongs_to :user, :inverse_of => :bookings
end
