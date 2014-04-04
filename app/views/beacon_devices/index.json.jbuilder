json.array!(@beacon_devices) do |beacon_device|
  json.extract! beacon_device, :id, :user_id, :beacon_id
  json.url beacon_device_url(beacon_device, format: :json)
end
