json.array!(@beacons) do |beacon|
  json.extract! beacon, :id, :uuid, :major, :minor
  json.item beacon.item
  json.templates_all do
    json.template_article beacon.item.template
    json.template_photo beacon.item.template_photo
    if beacon.item.name === "Template3"
      json.template_wine_list do
        json.array!(@template_wines) do |template_wine|
          json.extract! template_wine, :id, :name, :taste_notes, :price, :wine_specs_vintage, :wine_specs_sugar, :wine_specs_appellation, :wine_specs_acid, :wine_specs_alcohol, :wine_specs_ph, :item_id
        end
      end
    end
  end
  json.url beacon_url(beacon, format: :json)
end
