json.array!(@notifications) do |notification|
  json.extract! notification, :id, :device_id, :os, :beacon_id, :content
  json.url notification_url(notification, format: :json)
end
