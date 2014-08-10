json.array!(@beacons) do |beacon|
  json.extract! beacon, :id, :uuid, :major, :minor
  json.item beacon.item
  json.templates_all do
    json.template_something beacon.item.template
    json.template_photo beacon.item.template_photo
  end

  json.url beacon_url(beacon, format: :json)
end
