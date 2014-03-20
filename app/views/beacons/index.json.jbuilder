json.array!(@beacons) do |beacon|
  json.extract! beacon, :id, :uuid, :major, :minor, :item
  json.url beacon_url(beacon, format: :json)
end
