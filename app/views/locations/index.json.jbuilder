json.array!(@locations) do |location|
  json.extract! location, :name, :address_line_1, :address_line_2, :town_city, :county, :postcode, :country, :organization_id
  json.url location_url(location, format: :json)
end
