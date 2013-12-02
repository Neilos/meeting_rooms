class RenameUserToBookerInBookingsTable < ActiveRecord::Migration
  def change
    change_table :bookings do |t|
      t.rename :user_id, :booker_id 
    end
  end
end
