json.extract! flight, :id, :flight_number, :seats_taken, :departure, :destination, :depart_date, :reservation_obj, :airplane_id, :created_at, :updated_at
json.url flight_url(flight, format: :json)
