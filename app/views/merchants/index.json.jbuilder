json.array!(@merchants) do |merchant|
  json.extract! merchant, :id, :company_name
  json.url merchant_url(merchant, format: :json)
end
