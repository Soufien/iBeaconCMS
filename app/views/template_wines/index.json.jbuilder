json.array!(@template_wines) do |template_wine|
  json.extract! template_wine, :id
  json.url template_wine_url(template_wine, format: :json)
end
