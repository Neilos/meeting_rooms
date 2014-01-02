require 'spec_helper'

describe Reservation do

  describe "occurrences_between" do

    let!(:repeating_booking) { FactoryGirl.create(:booking,
      from_date: Time.now.beginning_of_day,
      from_time: Time.now.beginning_of_day,
      to_date: Time.now.beginning_of_day,
      to_time: Time.now.beginning_of_day + 1.hour,
      repeats: "daily",
      repeats_every_n_days: 1,
      repeat_ends: 'never')
    }

    let(:begin_date){Time.now.beginning_of_day}
    let(:end_date){Time.now.beginning_of_day + 5.day - 1.second}
    let(:calendar_ids){repeating_booking.calendar.id.to_s}

    subject{ Reservation.occurrences_between(begin_date, end_date, calendar_ids) }

    it "returns an array of reservations with all the correct fields" do
      expect(subject.count).to eq 5

      subject.each do |reservation|
        expect(reservation).to be_a Reservation
      end

      expect(subject.first.title).to eq repeating_booking.name
      expect(subject.first.color).to eq "red"
      expect(subject.first.url).to eq Rails.application.routes.url_helpers.booking_path(repeating_booking)
      expect(subject.first.start).to eq repeating_booking.from
      expect(subject.first.end).to eq(repeating_booking.from + repeating_booking.duration)
      expect(subject.first.allDay).to eq repeating_booking.is_all_day
      expect(subject.first.booking_id).to eq repeating_booking.id
      expect(subject.first.textColor).to eq 'black'
    end

  end

end