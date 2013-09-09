json.array!(@memberships) do |membership|
  json.extract! membership, :user_id, :organization_id, :permission_set_id
  json.url membership_url(membership, format: :json)
end
