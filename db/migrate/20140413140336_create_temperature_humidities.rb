class CreateTemperatureHumidities < ActiveRecord::Migration
  def change
    create_table :temperature_humidities do |t|
      t.text :date
      t.text :time
      t.integer :temperature
      t.integer :humidity

      t.timestamps

      t.index :date
      t.index :time
    end
  end
end
