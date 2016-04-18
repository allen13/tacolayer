json.array!(@tacos) do |taco|
  json.extract! taco, :id, :title, :url
  json.url taco_url(taco, format: :json)
end
