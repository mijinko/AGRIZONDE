class AddColumnPlaceIdToTemperatureHumidities < ActiveRecord::Migration
  def change
    add_column :temperature_humidities, :place_id, :integer
    add_index :temperature_humidities, :place_id
  end
end
