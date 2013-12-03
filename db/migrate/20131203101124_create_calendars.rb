class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :color
      t.integer :room_id

      t.timestamps
    end
  end
end
