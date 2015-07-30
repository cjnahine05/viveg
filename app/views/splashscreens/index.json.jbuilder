json.array!(@splashscreens) do |splashscreen|
  json.extract! splashscreen, :id, :name, :video
  json.url splashscreen_url(splashscreen, format: :json)
end
