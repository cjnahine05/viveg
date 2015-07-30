json.array!(@coordinates) do |coordinate|
  json.extract! coordinate, :id, :pages_id, :product_name, :coordinates
  json.url coordinate_url(coordinate, format: :json)
end
