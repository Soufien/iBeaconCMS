json.array!(@beacons) do |beacon|
  json.id   beacon.id
  json.uuid beacon.uuid.to_s
  json.major beacon.major.to_s
  json.minor beacon.minor.to_s
  json.item do
    json.id beacon.item.id.to_s
    json.spec beacon.item.spec.to_s
    json.name beacon.item.name.to_s
    json.description beacon.item.description.to_s
    json.show_after_seconds beacon.item.show_after_seconds.to_s
    json.beacon_id beacon.item.beacon_id.to_s
  end
  json.templates_all do
    if beacon.item.name === "Template1"
      json.template_photo do
        json.id beacon.item.template_photo.id.to_s
        json.name beacon.item.template_photo.name.to_s
        json.title beacon.item.template_photo.title.to_s
        json.description beacon.item.template_photo.description.to_s
        json.photolink beacon.item.template_photo.photolink.to_s
        json.url_image beacon.item.template_photo.url_image_1.to_s
      end
    end
    if beacon.item.name === "Template2"
      json.template_article do
           json.id beacon.item.template.id.to_s
           json.name beacon.item.template.name.to_s
           json.description_1 beacon.item.template.description_1.to_s
           json.description_2 beacon.item.template.description_2.to_s
           json.photo_link_1 beacon.item.template.photo_link_1.to_s
           json.photo_link_2 beacon.item.template.photo_link_2.to_s
           json.url_image_1 beacon.item.template.url_image_1.to_s
           json.url_image_2 beacon.item.template.url_image_2.to_s
      end
    end
    if beacon.item.name === "Template3" && beacon.item.spec == "WINE TASTING"
      json.template_wine_list do
        json.array!(@template_wines.vineyard) do |template_wine|
           json.id template_wine.id.to_s
           json.name template_wine.name.to_s
           json.taste_notes template_wine.taste_notes.to_s
           json.price template_wine.price.to_s
           json.wine_specs_vintage template_wine.wine_specs_vintage.to_s
           json.wine_specs_sugar template_wine.wine_specs_sugar.to_s
           json.wine_specs_appellation template_wine.wine_specs_appellation.to_s
           # json.wine_specs_acid template_wine.wine_specs_acid.to_s
           # json.wine_specs_alcohol template_wine.wine_specs_alcohol.to_s
           # json.wine_specs_ph template_wine.wine_specs_ph.to_s
           json.wine_specs_price_description template_wine.wine_specs_price_description.to_s
           json.photo_link template_wine.photo_link.to_s
           json.url_image template_wine.url_image_1.to_s
        end
      end
    else
      if beacon.item.name === "Template3"
        json.template_wine_list do
          json.array!(@template_wines) do |template_wine|
            json.id template_wine.id.to_s
            json.name template_wine.name.to_s
            json.taste_notes template_wine.taste_notes.to_s
            json.price template_wine.price.to_s
            json.wine_specs_vintage template_wine.wine_specs_vintage.to_s
            json.wine_specs_sugar template_wine.wine_specs_sugar.to_s
            json.wine_specs_appellation template_wine.wine_specs_appellation.to_s
            # json.wine_specs_acid template_wine.wine_specs_acid.to_s
            # json.wine_specs_alcohol template_wine.wine_specs_alcohol.to_s
            # json.wine_specs_ph template_wine.wine_specs_ph.to_s
            json.wine_specs_price_description template_wine.wine_specs_price_description.to_s
            json.photo_link template_wine.photo_link.to_s
            json.url_image template_wine.url_image_1.to_s
          end
        end
      end
    end
  json.url beacon_url(beacon, format: :json)
  end
end