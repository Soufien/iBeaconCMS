json.array!(@beacons) do |beacon|
  json.extract! beacon, :id, :uuid, :major, :minor
  json.item beacon.item
  json.templates_all do
    if beacon.item.name.equal? "Template1"
      json.template_article beacon.item.template
    else
      json.template_photo beacon.item.template_photo
    end
  end

  json.url beacon_url(beacon, format: :json)
end
