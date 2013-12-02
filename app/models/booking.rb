require 'booking_methods'
class Booking < ActiveRecord::Base
  include BookingMethods
  belongs_to :room, :inverse_of => :bookings
  belongs_to :booker, :class_name => "User", foreign_key: "booker_id", :inverse_of => :bookings

  validates_presence_of :name
  validates_presence_of :room_id
  validates_presence_of :booker_id
  validates_presence_of :from_date
  validates_presence_of :to_date
  validates_presence_of :time_zone
  validates_presence_of :from_time, :if => :not_all_day?
  validates_presence_of :to_time, :if => :not_all_day?

  def not_all_day?
    !is_all_day
  end
end
