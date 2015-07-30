json.array!(@pages) do |page|
  json.extract! page, :id, :magazines_id, :page_number, :image
  json.url page_url(page, format: :json)
end
