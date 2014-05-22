# coding: utf-8
class Event < ActiveRecord::Base

  # 平均温度と湿度を全て走査してeventsテーブルに詰めなおす
  def self.reflesh_create_avg_temp_and_hum
    # データをすべて削除
    Event.delete_all

    # 平均温度と平均湿度を取得
    datas = TemperatureHumidity.get_all_date_avg_temp_and_hum
    datas.each do |data|
      start = data[:log_date]
      title = "平均温度：#{sprintf('%.1f', data[:avg_temp])}℃ 平均湿度：#{sprintf('%.1f', data[:avg_hum])}%"
      event_data = {
          start: data[:log_date],
          title: title
      }
      # eventsテーブルに挿入または更新
      create_or_update_events(event_data)
    end
  end

  private
  def self.create_or_update_events(data)
    ActiveRecord::Base.transaction do
      exist_hash = {
          start: data[:start],
          color: 'green'
      }
      if Event.exists?(exist_hash)
        logger.info "データが既に存在しています：#{exist_hash}"
        event = Event.find_by(exist_hash)
        event.update_attribute(title: data[:title])
      else
        create_hash = {
            title: data[:title],
            start: data[:start],
            color: 'green',
            editable: false
        }
        Event.create(create_hash)
      end
    end
  end
end
