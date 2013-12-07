class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /rooms/1/bookings
  # GET /rooms/1/bookings.json
  def index
    @calendar = Room.find(params[:room_id]).calendar
    @bookings = Booking.where(:calendar_id => @calendar.id)
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /rooms/1/bookings/new
  def new
    room = Room.find(params[:room_id])
    calendar = room.calendar
    @booking = Booking.new(:calendar_id => calendar.id,
      :booker_id => current_user.id, :is_all_day => true)
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /rooms/1/bookings
  # POST /rooms/1/bookings.json
  def create
    @booking = Booking.new(booking_params.merge({:booker_id=> current_user.id}))

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render action: 'show', status: :created, location: @booking }
      else
        format.html { render action: 'new' }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @room = @booking.calendar.room
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to room_bookings_url(@room) }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:name, :description, :is_all_day, :from_date, :from_time, :to_date, :to_time, :repeats, :repeats_every_n_days, :repeats_every_n_weeks, :repeats_weekly_each_days_of_the_week_mask, :repeats_every_n_months, :repeats_monthly, :repeats_monthly_each_days_of_the_month_mask, :repeats_monthly_on_ordinals_mask, :repeats_monthly_on_days_of_the_week_mask, :repeats_every_n_years, :repeats_yearly_each_months_of_the_year_mask, :repeats_yearly_on, :repeats_yearly_on_ordinals_mask, :repeats_yearly_on_days_of_the_week_mask, :repeat_ends, :repeat_ends_on, :time_zone, :calendar_id)
  end
end
