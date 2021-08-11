class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.text :flight_number
      t.integer :seats_taken
      t.text :origin
      t.text :destination
      t.datetime :depart_date
      t.text :reservation_obj
      t.integer :airplane_id

      t.timestamps
    end
  end
end
