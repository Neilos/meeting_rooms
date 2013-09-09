json.array!(@custom_attributes) do |custom_attribute|
  json.extract! custom_attribute, :name, :value, :room_id
  json.url custom_attribute_url(custom_attribute, format: :json)
end
