class Reservation
  include Rails.application.routes.url_helpers
  extend Rails.application.routes.url_helpers
  include ActiveModel::AttributeMethods
  delegate :url_helpers, to: 'Rails.application.routes'
  attr_accessor :title, :start, :end, :allDay, :booking_id, :color, :url, :background_color, :textColor

  def self.occurrences_between(begin_date,end_date, room_ids = '')
    # Using Squeel
    # line 1 = Booking doesn't repeat, but ends in window
    # line 2 = Booking doesn't repeat, but starts in window
    # line 2 = Booking doesn't repeat, but starts before and ends after
    # line 4 = Booking starts before our end date and repeats until a certain point of time, and that point of time after our begin date
    # line 5 = Booking repeats indefinitely, then all we care about is that it has started at somepoint in the last
    if !room_ids.empty?
      results = Booking.where{
        (
          (repeats == 'never') &
          (from_date >= begin_date) &
          (from_date <= end_date)
        ) | (
          (repeats == 'never') &
          (to_date >= begin_date) &
          (to_date <= end_date)
        ) | (
          (repeats == 'never') &
          (from_date <= begin_date) &
          (to_date >= end_date)
        ) | (
          (repeats != 'never') &
          (from_date <= end_date) &
          (repeat_ends == 'on') &
          (repeat_ends_on >= begin_date)
        ) | (
          (repeats != 'never') &
          (repeat_ends == 'never') &
          (from_date <= end_date)
        )
      }.where(:room_id => room_ids.split(',').reject{ |c| c.empty? }.uniq)
    else
     results = Booking.where{
       (
         (repeats == 'never') &
         (from_date >= begin_date) &
         (from_date <= end_date)
       ) | (
         (repeats == 'never') &
         (to_date >= begin_date) &
         (to_date <= end_date)
       ) | (
         (repeats == 'never') &
         (from_date <= begin_date) &
         (to_date >= end_date)
       ) | (
         (repeats != 'never') &
         (from_date <= end_date) &
         (repeat_ends == 'on') &
         (repeat_ends_on >= begin_date)
       ) | (
         (repeats != 'never') &
         (repeat_ends == 'never') &
         (from_date <= end_date)
       )
     }
    end
    results.map { |booking|
      booking.schedule.occurrences_between(begin_date,end_date).map { |date|
        i = Reservation.new()
        i.title = booking.name
        i.color = "red"
        i.url = Rails.application.routes.url_helpers.booking_path(booking)
        i.start = date
        i.end = date + booking.duration
        i.allDay = booking.is_all_day
        i.booking_id = booking.id
        i.textColor = 'black'
        i
      }
    }.flatten.sort! {|x,y| x.start <=> y.start }
  end

end