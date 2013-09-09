json.array!(@rooms) do |room|
  json.extract! room, :name, :price_per_hour, :location_id, :organization_id, :people_capacity
  json.url room_url(room, format: :json)
end
