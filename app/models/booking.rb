require 'booking_methods'
class Booking < ActiveRecord::Base
  include BookingMethods
  belongs_to :calendar, :inverse_of => :bookings
  delegate :room, :to => :calendar, :allow_nil => true
  belongs_to :booker, :class_name => "User", foreign_key: "booker_id", :inverse_of => :bookings
  before_validation :set_default_values_for_blank_fields
  validates_presence_of :name
  validates_presence_of :calendar_id
  validates_presence_of :booker_id
  validates_presence_of :time_zone


  def set_default_values_for_blank_fields
    self.from_date = Date.today unless from_date
    self.to_date = Date.today unless to_date
    unless is_all_day
      self.from_time = Time.now.beginning_of_day unless from_time
      self.to_time = Time.now.end_of_day unless to_time
    end
  end

end
