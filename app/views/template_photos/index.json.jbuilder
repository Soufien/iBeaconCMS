json.array!(@template_photos) do |template_photo|
  json.extract! template_photo, :id
  json.url template_photo_url(template_photo, format: :json)
end
