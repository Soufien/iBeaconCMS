json.array!(@apps) do |app|
  json.extract! app, :id, :user_id, :name, :description
  json.url app_url(app, format: :json)
end
