class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address_line_1
      t.string :address_line_2
      t.string :town_city
      t.string :county
      t.string :postcode
      t.string :country

      t.timestamps
    end
  end
end
