class CreateTemperatureHumidities < ActiveRecord::Migration
  def change
    create_table :temperature_humidities do |t|
      t.text :log_date
      t.text :log_time
      t.float :temperature
      t.float :humidity

      t.timestamps

      t.index :log_date
      t.index :log_time
    end
  end
end
