class ReservationsController < ApplicationController
  def index
    begin_date = DateTime.parse(params[:begin_date])
    end_date = DateTime.parse(params[:end_date])
    calendar_ids = params[:calendar_ids]
    @reservations = Reservation.occurrences_between(begin_date, end_date, calendar_ids)
  end
end
