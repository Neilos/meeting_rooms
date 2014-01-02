require 'spec_helper'

describe ReservationsController do

  describe "GET 'index'" do

    let!(:repeating_booking) { FactoryGirl.create(:booking,
      from_date: Time.now.beginning_of_day,
      from_time: Time.now.beginning_of_day,
      to_date: Time.now.beginning_of_day,
      to_time: Time.now.beginning_of_day + 1.hour,
      repeats: "daily",
      repeats_every_n_days: 1,
      repeat_ends: 'never')
    }

    it "returns the correct number of reservations for the specified period" do
      params = {
        begin_date: Time.now.beginning_of_day,
        end_date: Time.now.beginning_of_day + 5.days - 1.second,
        calendar_ids: repeating_booking.calendar.id.to_s,
      }
      get 'index', params
      response.should be_success
      expect(assigns(:reservations).count).to eq 5
    end

  end

end
