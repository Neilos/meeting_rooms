class CreateCustomAttributes < ActiveRecord::Migration
  def change
    create_table :custom_attributes do |t|
      t.string :name
      t.string :value
      t.integer :room_id

      t.timestamps
    end
  end
end
