json.array!(@beacons) do |beacon|
  json.extract! beacon, :id, :uuid, :major, :minor
  json.item beacon.item
  json.templates beacon.item.template
  json.template_photo beacon.item.template_photo
  json.url beacon_url(beacon, format: :json)
end
