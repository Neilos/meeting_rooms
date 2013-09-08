class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.decimal :price_per_hour
      t.integer :location_id
      t.integer :organization_id
      t.integer :people_capacity

      t.timestamps
    end
  end
end
