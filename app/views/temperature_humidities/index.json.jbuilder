json.array!(@temperature_humidities) do |temperature_humidity|
  json.extract! temperature_humidity, :id, :date, :time, :temperature, :humidity
  json.url temperature_humidity_url(temperature_humidity, format: :json)
end
