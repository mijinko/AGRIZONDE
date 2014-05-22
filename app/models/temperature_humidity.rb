# coding: utf-8
class TemperatureHumidity < ActiveRecord::Base
  require 'csv'
  require 'kconv'

  # WATCH_LOGGERのlogのcsvファイルをテーブルに挿入または更新する
  def self.import_watch_logger_log_csv(watch_logger_log_csv)
    if !watch_logger_log_csv
      return FAILURE_CREATE_OR_UPDATE
    end

    # csvファイルをデータベースに挿入
    return create_or_update_watch_logger_log_csv(watch_logger_log_csv)
  end

  # 指定された日付の温度湿度を時間の昇順に取得する
  def self.get_TemperaturHumidites_where_log_date_order_by_log_time(log_date)
    TemperatureHumidity.where('log_date = ?', log_date).order('log_time ASC')
  end

  # 全日付の平均温度、平均湿度を取得する
  def self.get_all_date_avg_temp_and_hum()
    TemperatureHumidity.find_by_sql('SELECT log_date, AVG(temperature) AS "avg_temp", AVG(humidity) AS "avg_hum" FROM temperature_humidities GROUP BY log_date')
  end

  private
  # WATCH_LOGGERのlogのcsvファイルから日付、時間、場所、温度、湿度を挿入または更新する。挿入された場合
  def self.create_or_update_watch_logger_log_csv(watch_logger_log_csv)
    result_string = ''
    # ファイルを読み込む
    watch_logger_log_csv_data = watch_logger_log_csv.read

    # CSVファイルを走査する
    ActiveRecord::Base.transaction do
      place_id = 0
      CSV.parse(watch_logger_log_csv_data.kconv(Kconv::UTF8, Kconv::SJIS)) do |row|
        if 'H2' == row[0]
          # TODO 場所を画面から選択できるようにする、またはWATCH_LOGGERのlogのcsvから場所IDを取得する
          # place_idをセット
          place_id = 1
        elsif 'SD' == row[0]
          exist_hash = {
              log_date: row[1].split[0],
              log_time: row[1].split[1],
              place_id: place_id
          }
          if TemperatureHumidity.exists?(exist_hash)
            logger.info "データが既に存在しています：#{exist_hash}"
            temperature_humidity_data = TemperatureHumidity.find_by(exist_hash)
            temperature_humidity_data.update_attributes(temperature: row[2], humidity: row[3])
            result_string = SUCCESS_UPDATE
          else
            # 日付、場所、温度、湿度を挿入する
            create_hash = {
                log_date: row[1].split[0],
                log_time: row[1].split[1],
                temperature: row[2],
                humidity: row[3],
                place_id: place_id
            }
            TemperatureHumidity.create(create_hash)
          end
        end
      end
    end
    watch_logger_log_csv.rewind

    if SUCCESS_UPDATE != result_string
      result_string = SUCCESS_CREATE
    end

    return result_string
  end
end
