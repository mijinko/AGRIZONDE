# coding: utf-8
class TemperatureHumidity < ActiveRecord::Base
  require 'csv'
  require 'kconv'

  # WATCH_LOGGERのlogのcsvファイルをテーブルに挿入または更新する
  def self.import_watch_logger_log_csv(watch_logger_log_csv)
    # csvファイルをデータベースに挿入
    insert_watch_logger_log_csv(watch_logger_log_csv)
  end

  private
  # WATCH_LOGGERのlogのcsvファイルから、含まれる日付を取得する
  def self.get_watch_logger_log_csv_date(watch_logger_log_csv)
    date_array =[]
    watch_logger_log_csv_data = watch_logger_log_csv.read

    # CSVファイルを走査する
    CSV.parse(watch_logger_log_csv_data.kconv(Kconv::UTF8, Kconv::SJIS)) do |row|
      if 'SD' == row[0]
        date_time_string = row[1]
        date_string = date_time_string.split[0]
        date_array.push(date_string)
      end
    end
    watch_logger_log_csv.rewind
    return date_array.uniq
  end

  # WATCCH_LOGGERのlogのcsvファイルから日付、時間、場所、温度、湿度を挿入する
  def self.insert_watch_logger_log_csv(watch_logger_log_csv)
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
            logger.info "データさ既に存在しています：#{exist_hash}"
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
            #date_time_string = row[1]
            #date_string = date_time_string.split[0]
            #time_string = date_time_string.split[1]
            #temp_real = row[2]
            #hum_real = row[3]
            #TemperatureHumidity.create(date: date_string, time: time_string, temperature: temp_real, humidity: hum_real)
          end
        end
      end
    end
    watch_logger_log_csv.rewind
    return
  end
end
