class RenameRoomIdToCalendarIdInBookingsTable < ActiveRecord::Migration
  def change
    change_table :bookings do |t|
      t.rename :room_id, :calendar_id
    end
  end
end
